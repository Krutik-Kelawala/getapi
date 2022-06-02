import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;

class fakeproductpage extends StatefulWidget {
  @override
  _fakeproductpageState createState() => _fakeproductpageState();
}

class _fakeproductpageState extends State<fakeproductpage> {
  List<productfakeapi> fakeproductview = [];

  // bool isloadapp = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // setState(() {
    //   isloadapp = true;
    // });
    fakeproductdataget();
  }

  fakeproductdataget() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List prodctdata = jsonDecode(response.body);

    for (int i = 0; i < prodctdata.length; i++) {
      productfakeapi productview = productfakeapi.fromJson(prodctdata[i]);
      setState(() {
        fakeproductview.add(productview);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return

        // shimer
        //     ? Scaffold(
        //         appBar: AppBar(
        //           title: Text("Fake api (PRODUCT)"),
        //         ),
        //         body: WillPopScope(
        //           onWillPop: backback,
        //           child: Shimmer.fromColors(
        //             baseColor: Colors.grey,
        //             highlightColor: Colors.white70,
        //             child: ListView.builder(
        //               itemCount: fakeproductview.length,
        //               itemBuilder: (context, index) {
        //                 return Container(
        //                   margin: EdgeInsets.all(5),
        //                   height: 170,
        //                   width: double.infinity,
        //                   decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(10),
        //                       border: Border.all(width: 1)),
        //                   child: Column(
        //                     children: [
        //                       Row(
        //                         children: [
        //                           Container(
        //                             // margin: EdgeInsets.all(2),
        //                             height: 150,
        //                             width: 80,
        //                             decoration: BoxDecoration(
        //                               color: Colors.white,
        //                               borderRadius: BorderRadius.circular(10),
        //                               // image: DecorationImage(
        //                               //     image: NetworkImage(
        //                               //         "${fakeproductview[index].image}")
        //                               // )
        //                             ),
        //                           ),
        //                           Container(
        //                             color: Colors.white,
        //                             height: 150,
        //                             width: 300,
        //                             padding: EdgeInsets.only(left: 20),
        //                             child: Column(
        //                               crossAxisAlignment: CrossAxisAlignment.start,
        //                               children: [
        //                                 Container(
        //                                   height: 20,
        //                                   width: 10,
        //                                   // child: Text(
        //                                   //   "ID = ${fakeproductview[index].id}",
        //                                   //   style: TextStyle(
        //                                   //       fontWeight: FontWeight.bold),
        //                                   // ),
        //                                 ),
        //                                 Expanded(
        //                                   child: Container(
        //                                     color: Colors.white,
        //                                     height: 20, width: double.infinity,
        //                                     // child: Text(
        //                                     //   "Title = ${fakeproductview[index].title}",
        //                                     // ),
        //                                   ),
        //                                 ),
        //                                 Container(
        //                                   height: 20,
        //                                   width: 10,
        //                                   color: Colors.white,
        //                                   // child: Text(
        //                                   //   "Price = ${fakeproductview[index].price}",
        //                                   //   style: TextStyle(
        //                                   //       color: Colors.blue,
        //                                   //       fontWeight: FontWeight.bold),
        //                                   // ),
        //                                 ),
        //                                 Expanded(
        //                                   child: Container(
        //                                     color: Colors.white,
        //                                     height: 20,
        //                                     width: double.infinity,
        //                                     // child: Text(
        //                                     //   "Description = ${fakeproductview[index].description}",
        //                                     // ),
        //                                   ),
        //                                 ),
        //                                 Container(
        //                                   height: 20,
        //                                   width: double.infinity,
        //                                   color: Colors.white,
        //                                   // child: Text(
        //                                   //     "Category = ${fakeproductview[index].category}"),
        //                                 ),
        //                                 Container(
        //                                   height: 20,
        //                                   width: 30,
        //                                   color: Colors.white,
        //                                   // child: Text(
        //                                   //   "Rating = ${fakeproductview[index].rating!.rate}",
        //                                   //   style: TextStyle(
        //                                   //       color: Colors.red,
        //                                   //       fontWeight: FontWeight.bold),
        //                                   // ),
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.all(8.0),
        //                                   child: Container(
        //                                     height: 20,
        //                                     width: 50,
        //                                     color: Colors.white,
        //                                     // child: Text(
        //                                     //   "Count = ${fakeproductview[index].rating!.count}",
        //                                     //   style: TextStyle(
        //                                     //       color: Colors.red,
        //                                     //       fontWeight: FontWeight.bold),
        //                                     // ),
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           )
        //                         ],
        //                       )
        //                     ],
        //                   ),
        //                 );
        //               },
        //             ),
        //           ),
        //         ),
        //       )
        Scaffold(
      appBar: AppBar(
        title: Text("Fake api (PRODUCT)"),
      ),
      body: WillPopScope(
        onWillPop: backback,
        child: ListView.builder(
          itemCount: fakeproductview.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(5),
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        // margin: EdgeInsets.all(2),
                        height: 150,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "${fakeproductview[index].image}"))),
                      ),
                      Container(
                        height: 150,
                        width: 300,
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ID = ${fakeproductview[index].id}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Text(
                                "Title = ${fakeproductview[index].title}",
                              ),
                            ),
                            Text(
                              "Price = ${fakeproductview[index].price}",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Text(
                                "Description = ${fakeproductview[index].description}",
                              ),
                            ),
                            Text(
                                "Category = ${fakeproductview[index].category}"),
                            Text(
                              "Rating = ${fakeproductview[index].rating!.rate}",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Count = ${fakeproductview[index].rating!.count}",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<bool> backback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return Apicalling();
      },
    ));
    return Future.value(true);
  }
}

class productfakeapi {
  int? id;
  String? title;
  dynamic? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  productfakeapi(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  productfakeapi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Rating {
  dynamic? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
