import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;

class cartpage extends StatefulWidget {
  @override
  _cartpageState createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  List<cartapicall> cartdataview = [];
  cartapicall? viewdatalist; // use for print so here declare as global

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getcartdata();
  }

  getcartdata() async {
    var url = Uri.parse('https://fakestoreapi.com/carts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List cartget = jsonDecode(response.body);

    for (int i = 0; i < cartget.length; i++) {
      cartapicall viewdatalist = cartapicall.fromJson(cartget[i]);
      setState(() {
        cartdataview.add(viewdatalist);
      });
    }
    print("fffdd==${viewdatalist}");
    print("fffdd==${cartdataview}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake api (CART)"),
      ),
      body: WillPopScope(
        onWillPop: nextpg,
        child: ListView.builder(
          itemCount: cartdataview.length,
          itemBuilder: (context, index) {
            return Container(
              height: 150,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              padding: EdgeInsets.all(10),
              // height: 100,
              // width: 100,
              child: Container(
                // height: 50,
                // width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "ID = ${cartdataview[index].id}\n",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "User id = ${cartdataview[index].userId}\n",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "Date : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "${cartdataview[index].date}\n",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "Products : \n",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: "Products ID : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text:
                                  "${cartdataview[index].products![0].productId}\n",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "Quantity : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text:
                                  "${cartdataview[index].products![index].quantity}\n",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "__v = ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "${cartdataview[index].iV}",
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<bool> nextpg() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return Apicalling();
      },
    ));
    return Future.value(true);
  }
}

class cartapicall {
  int? id;
  int? userId;
  String? date;
  List<Products>? products;
  int? iV;

  cartapicall({this.id, this.userId, this.date, this.products, this.iV});

  cartapicall.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    date = json['date'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['date'] = this.date;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Products {
  int? productId;
  int? quantity;

  Products({this.productId, this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    return data;
  }
}
