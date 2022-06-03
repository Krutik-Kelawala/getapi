import 'dart:async';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class strampg extends StatefulWidget {
  @override
  _strampgState createState() => _strampgState();
}

class _strampgState extends State<strampg> {
  StreamController<String> mm = StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Builder"),
      ),
      body: WillPopScope(
        onWillPop: mainppgg,
        child: StreamBuilder(
          stream: mm.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("${snapshot.data.toString()}");
            } else {
              return Center(child: Text("Loading......"));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getdata();
        },
        child: Text("Data"),
      ),
    );
  }

  getdata() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    mm.sink.add(response.body);
  }

  Future<bool> mainppgg() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return Apicalling();
      },
    ));
    return Future.value(true);
  }
}
