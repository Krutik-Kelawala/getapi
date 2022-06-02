import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/categorymap.dart';
import 'package:getapi/fakeapicart.dart';
import 'package:getapi/fakeproductapi.dart';
import 'package:getapi/secongpage.dart';
import 'package:getapi/userfakeapi.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: Apicalling(),
  ));
}

class Apicalling extends StatefulWidget {
  @override
  _ApicallingState createState() => _ApicallingState();
}

class _ApicallingState extends State<Apicalling> {
  List<Getalldata> mydatalist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getviewdata();
  }

  getviewdata() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List apicallresponse = jsonDecode(response.body);

    for (int i = 0; i < apicallresponse.length; i++) {
      Getalldata mm = Getalldata.fromJson(apicallresponse[i]);
      setState(() {
        mydatalist.add(mm);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return fakeproductpage();
                  },
                ));
              },
              leading: Icon(Icons.production_quantity_limits),
              title: Text("Fake Product api"),
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return cartpage();
                  },
                ));
              },
              leading: Icon(Icons.production_quantity_limits),
              title: Text("Fake Cart api"),
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return userfakeapipage();
                  },
                ));
              },
              leading: Icon(Icons.person),
              title: Text("Fake User api"),
            ), ListTile(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return categorymappage();
                  },
                ));
              },
              leading: Icon(Icons.shopping_cart),
              title: Text("Fake Category api"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Post map"),
      ),
      body: ListView.builder(
        itemCount: mydatalist.length,
        itemBuilder: (context, index) {
          return Dismissible(
            direction: DismissDirection.startToEnd,
            key: Key(mydatalist.toString()),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                print("Deleted");
                setState(() {
                  mydatalist.removeAt(index);
                });
              }
            },
            background: Container(
              decoration: BoxDecoration(color: Colors.red),
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  Text(
                    "Move To Trash",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    title: Text(
                      "Confirm Delete",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    content: Text("Are you sure delete this item ? "),
                    actions: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Text(
                                "Delete",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          Divider(
                            height: 5,
                            thickness: 3,
                          ),
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  );
                },
              );
            },
            child: ListTile(
              subtitle: Text(
                "${mydatalist[index].body}",
                maxLines: 3,
              ),
              title: Text("${mydatalist[index].title}"),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Next"),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return secondpg();
            },
          ));
        },
      ),
    );
  }
}

class Getalldata {
  int? userId;
  int? id;
  String? title;
  String? body;

  Getalldata({this.userId, this.id, this.title, this.body});

  Getalldata.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
