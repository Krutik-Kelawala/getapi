import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/albummap.dart';
import 'package:getapi/photopage.dart';
import 'package:http/http.dart' as http;

class todopage extends StatefulWidget {
  @override
  _todopageState createState() => _todopageState();
}

class _todopageState extends State<todopage> {
  List<mytodo> todolist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    todoview();
  }

  todoview() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List tododata = jsonDecode(response.body);

    for (int i = 0; i < tododata.length; i++) {
      mytodo dataaa = mytodo.fromJson(tododata[i]);
      setState(() {
        todolist.add(dataaa);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO map"),
      ),
      body: WillPopScope(
        onWillPop: backreverse,
        child: ListView.builder(
          itemCount: todolist.length,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "User id = ${todolist[index].userId}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Id = ${todolist[index].id}",
                  ),
                  Text(
                    "Title = ${todolist[index].title}",
                    maxLines: 1,
                  ),
                  Text(
                    "Status = ${todolist[index].completed}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Next"),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return phototapipg();
            },
          ));
        },
      ),
    );
  }

  Future<bool> backreverse() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return albummappg();
      },
    ));
    return Future.value(true);
  }
}

class mytodo {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  mytodo({this.userId, this.id, this.title, this.completed});

  mytodo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}
