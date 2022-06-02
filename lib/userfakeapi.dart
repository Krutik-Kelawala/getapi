import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class userfakeapipage extends StatefulWidget {
  @override
  _userfakeapipageState createState() => _userfakeapipageState();
}

class _userfakeapipageState extends State<userfakeapipage> {
  List<getmyuserfakeapi> fakeuserapilist = [];
  bool dataloadstatus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getfakeuserapi();

  }

  getfakeuserapi() async {
    var url = Uri.parse('https://fakestoreapi.com/users');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List fakeuserviewdata = jsonDecode(response.body);
    for (int i = 0; i < fakeuserviewdata.length; i++) {
      getmyuserfakeapi viewfakeusser =
          getmyuserfakeapi.fromJson(fakeuserviewdata[i]);
      setState(() {
        fakeuserapilist.add(viewfakeusser);
          dataloadstatus = true;

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return dataloadstatus
        ? Scaffold(
            appBar: AppBar(
              title: Text("FAke api (USER)"),
            ),
            body: WillPopScope(
              onWillPop: firstpg,
              child: ListView.builder(
                itemCount: fakeuserapilist.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(20))),
                    height: 350,
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: Text(
                              "Address : \n Geolocation : \n  Lat : ${fakeuserapilist[index].address!.geolocation!.lat}"),
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          child: Text(
                              "  long : ${fakeuserapilist[index].address!.geolocation!.long}"),
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          child: Text(
                              " City : ${fakeuserapilist[index].address!.city}"),
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          child: Text(
                              " Street : ${fakeuserapilist[index].address!.street}"),
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          child: Text(
                              " Number : ${fakeuserapilist[index].address!.number}"),
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          child: Text(
                              " Zipcode : ${fakeuserapilist[index].address!.zipcode}"),
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          child: Text(
                            "ID : ${fakeuserapilist[index].id}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          child:
                              Text("Email : ${fakeuserapilist[index].email}"),
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          child: Text(
                              "User Name : ${fakeuserapilist[index].username}"),
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          child: Text(
                              "Password : ${fakeuserapilist[index].password}"),
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: Text(
                              "Name : \n\t First Name : ${fakeuserapilist[index].name!.firstname} \n\t Last Name : ${fakeuserapilist[index].name!.lastname}"),
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          child:
                              Text("Phone : ${fakeuserapilist[index].phone}"),
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          child: Text(" __V : ${fakeuserapilist[index].iV}"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text("FAke api (USER)"),
            ),
            body: WillPopScope(
              onWillPop: firstpg,
              child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white70,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20))),
                      height: 350,
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            width: double.infinity,

                            // child: Text(
                            //     "Address : \n Geolocation : \n  Lat : ${fakeuserapilist[index].address!.geolocation!.lat}"),
                          ),
                          Container(
                            height: 20,
                            width: 60,
                            margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            // child: Text(
                            //     "  long : ${fakeuserapilist[index].address!.geolocation!.long}"),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 20,
                            width: double.infinity,

                            // child: Text(
                            //     " City : ${fakeuserapilist[index].address!.city}"),
                          ),
                          // Container(
                          //   padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   height: 20,
                          //   width: double.infinity,
                          //
                          //   // child: Text(
                          //   //     " Street : ${fakeuserapilist[index].address!.street}"),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   height: 20,
                          //   width: double.infinity,
                          //
                          //   // child: Text(
                          //   //     " Number : ${fakeuserapilist[index].address!.number}"),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   height: 20,
                          //   width: double.infinity,
                          //
                          //   // child: Text(
                          //   //     " Zipcode : ${fakeuserapilist[index].address!.zipcode}"),
                          // ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 20,
                            width: double.infinity,

                            // child: Text(
                            //   "ID : ${fakeuserapilist[index].id}",
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       color: Colors.red),
                            // ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.all(5),
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   height: 20,
                          //   width: double.infinity,
                          //
                          //   // child:
                          //   //     Text("Email : ${fakeuserapilist[index].email}"),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.all(5),
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   height: 20,
                          //   width: double.infinity,
                          //
                          //   // child: Text(
                          //   //     "User Name : ${fakeuserapilist[index].username}"),
                          // ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 20,
                            width: 300,

                            // child: Text(
                            //     "Password : ${fakeuserapilist[index].password}"),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            width: 100,

                            // child: Text(
                            //     "Name : \n\t First Name : ${fakeuserapilist[index].name!.firstname} \n\t Last Name : ${fakeuserapilist[index].name!.lastname}"),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 20,
                            width: double.infinity,

                            // child:
                            //     Text("Phone : ${fakeuserapilist[index].phone}"),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 20,
                            width: 200,

                            // child: Text(" __V : ${fakeuserapilist[index].iV}"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
  }

  Future<bool> firstpg() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return Apicalling();
      },
    ));
    return Future.value(true);
  }
}

class getmyuserfakeapi {
  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  int? iV;

  getmyuserfakeapi(
      {this.address,
      this.id,
      this.email,
      this.username,
      this.password,
      this.name,
      this.phone,
      this.iV});

  getmyuserfakeapi.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    id = json['id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    phone = json['phone'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['phone'] = this.phone;
    data['__v'] = this.iV;
    return data;
  }
}

class Address {
  Geolocation? geolocation;
  String? city;
  String? street;
  int? number;
  String? zipcode;

  Address(
      {this.geolocation, this.city, this.street, this.number, this.zipcode});

  Address.fromJson(Map<String, dynamic> json) {
    geolocation = json['geolocation'] != null
        ? new Geolocation.fromJson(json['geolocation'])
        : null;
    city = json['city'];
    street = json['street'];
    number = json['number'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geolocation != null) {
      data['geolocation'] = this.geolocation!.toJson();
    }
    data['city'] = this.city;
    data['street'] = this.street;
    data['number'] = this.number;
    data['zipcode'] = this.zipcode;
    return data;
  }
}

class Geolocation {
  String? lat;
  String? long;

  Geolocation({this.lat, this.long});

  Geolocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}

class Name {
  String? firstname;
  String? lastname;

  Name({this.firstname, this.lastname});

  Name.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    return data;
  }
}
