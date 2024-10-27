import 'dart:convert';

import 'package:NewsApp/ipaddress.dart';
import 'package:NewsApp/model/fetchnews.dart';
import 'package:NewsApp/newsApp/categorynews.dart';
import 'package:NewsApp/newsApp/newsdisplay.dart';
import 'package:NewsApp/newsApp/particularnews.dart';
import 'package:NewsApp/return_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class CategoryWise extends StatefulWidget {
  const CategoryWise({super.key});
  @override
  State<CategoryWise> createState() => _CategoryWiseState();
}

class _CategoryWiseState extends State<CategoryWise> {
  String mainCategory = "";

  @override
  Widget build(BuildContext context) {
    var category = [
      {'cat_name': 'Social', 'onTap': "pushPlace"},
      {'cat_name': 'Sport', 'onTap': "pushPlace"},
      {'cat_name': 'Politics', 'onTap': "pushPlace"},
      {'cat_name': 'Economic', 'onTap': "pushPlace"},
      {'cat_name': 'Local', 'onTap': "pushPlace"}
    ];

    return Scaffold(
      appBar: AppBarr.appbar(),
      drawer: AppBarr.drawer(context),
      body: SafeArea(
          child: ListView.builder(
        itemCount: category.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              padding: EdgeInsets.all(20),
              // height: 30,
              color: Colors.black,
              margin: EdgeInsets.only(
                left: 10,
                top: 10,
                right: 10,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category[index]['cat_name']!,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )
                ],
              ),
            ),
            onTap: () async {
              mainCategory = category[index]['cat_name']!;
              print(category[index]['cat_name']!);

              // String
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => CategoryNews(mainCategory))));
            },
          );
        },
      )),
    );
  }
}
