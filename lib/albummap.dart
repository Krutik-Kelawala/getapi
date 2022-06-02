import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/photopage.dart';
import 'package:getapi/secongpage.dart';
import 'package:getapi/todomappage.dart';
import 'package:http/http.dart' as http;

class albummappg extends StatefulWidget {
  @override
  _albummappgState createState() => _albummappgState();
}

class _albummappgState extends State<albummappg> {
  List<getapidata> myviewlist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getviewall();
  }

  getviewall() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List apic = jsonDecode(response.body);

    for (int i = 0; i < apic.length; i++) {
      getapidata alldata = getapidata.fromJson(apic[i]);
      setState(() {
        myviewlist.add(alldata);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album map"),
      ),
      body: WillPopScope(
        onWillPop: backpg,
        child: ListView.builder(
          itemCount: myviewlist.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("User id = ${myviewlist[index].userId}"),
              subtitle: Text("${myviewlist[index].title}"),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Next"),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return todopage();
            },
          ));
        },
      ),
    );
  }

  Future<bool> backpg() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return secondpg();
      },
    ));
    return Future.value(true);
  }
}

class getapidata {
  int? userId;
  int? id;
  String? title;

  getapidata({this.userId, this.id, this.title});

  getapidata.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
