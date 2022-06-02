import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getapi/main.dart';

class categorymappage extends StatefulWidget {
  @override
  _categorymappageState createState() => _categorymappageState();
}

class _categorymappageState extends State<categorymappage> {
  List category = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getcategory();
  }

  getcategory() async {
    try {
      var response =
          await Dio().get('https://fakestoreapi.com/products/categories');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake api (CATEGORY)"),
      ),
      body: WillPopScope(
        onWillPop: mainpg,
        child: ListView.builder(
          itemCount: category.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${category[index]}"),
            );
          },
        ),
      ),
    );
  }

  Future<bool> mainpg() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return Apicalling();
      },
    ));
    return Future.value(true);
  }
}
