import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/albummap.dart';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;

class secondpg extends StatefulWidget {
  @override
  _secondpgState createState() => _secondpgState();
}

class _secondpgState extends State<secondpg> {
  List<getallmydata> getdata = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getviewdata();
  }

  getviewdata() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List apidata = jsonDecode(response.body);

    for (int i = 0; i < apidata.length; i++) {
      getallmydata mmvie = getallmydata.fromJson(apidata[i]);
      setState(() {
        getdata.add(mmvie);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coment map"),
      ),
      body: WillPopScope(
        onWillPop: back,
        child: ListView.builder(
          itemCount: getdata.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${getdata[index].email}"),
              subtitle: Text("${getdata[index].name}"),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Next"),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return albummappg();
            },
          ));
        },
      ),
    );
  }

  Future<bool> back() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return Apicalling();
      },
    ));
    return Future.value(true);
  }
}

class getallmydata {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  getallmydata({this.postId, this.id, this.name, this.email, this.body});

  getallmydata.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    return data;
  }
}
