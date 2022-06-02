import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/todomappage.dart';
import 'package:getapi/usermap.dart';
import 'package:http/http.dart' as http;

class phototapipg extends StatefulWidget {
  @override
  _phototapipgState createState() => _phototapipgState();
}

class _phototapipgState extends State<phototapipg> {
  List<photoviewdata> viewphotoapi = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getalbumapi();
  }

  getalbumapi() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List photoapi = jsonDecode(response.body);

    for (int i = 0; i < photoapi.length; i++) {
      photoviewdata abc = photoviewdata.fromJson(photoapi[i]);
      setState(() {
        viewphotoapi.add(abc);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo api"),
      ),
      body: WillPopScope(
        onWillPop: pageback,
        child: ListView.builder(
          itemCount: viewphotoapi.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Id = ${viewphotoapi[index].id}"),
              subtitle: Text("Title = ${viewphotoapi[index].title}"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage("${viewphotoapi[index].url}"),
              ),
              trailing: Image.network(
                "${viewphotoapi[index].thumbnailUrl}",
                height: 100,
                width: 50,
                fit: BoxFit.cover,
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
              return usermappg();
            },
          ));
        },
      ),
    );
  }

  Future<bool> pageback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return todopage();
      },
    ));
    return Future.value(true);
  }
}

class photoviewdata {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  photoviewdata(
      {this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  photoviewdata.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}
