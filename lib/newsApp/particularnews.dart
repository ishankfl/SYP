import 'package:NewsApp/return_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ParticularNews extends StatefulWidget {
  // const ParticularNews({super.key});
  String? heading;
  String? content;
  String? writer_name;
  String? category;

  // ignore: non_constant_identifier_names
  ParticularNews(var Heading, var Content, var writer, var category,
      {super.key}) {
    this.heading = Heading;
    this.content = Content;
    this.writer_name = writer;
    this.category = category;
  }

  @override
  State<ParticularNews> createState() =>
      _ParticularNewsState(heading, content, writer_name, category);
}

class _ParticularNewsState extends State<ParticularNews> {
  String? heading;
  String? content;
  String? writer;
  String? category;
  _ParticularNewsState(
    var heading,
    var content,
    var nwriter,
    var category,
  ) {
    this.content = content;
    this.heading = heading;
    this.writer = nwriter;
    this.category = category;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarr.appbar(),
      drawer: AppBarr.drawer(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: 120,
                padding: EdgeInsets.all(20),
                // alignment: Alignment.center,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 13, 13, 13),
                  // borderRadius: BorderRadius.circular(12.0),
                ),
                // padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      " ${heading}",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Color.fromARGB(255, 226, 226, 226),
                          fontSize: 20),

                      // style: textSytle,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " ${category}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          " ${writer}",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  " ${content}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 234, 229, 229),
                      fontSize: 15),

                  // style: textSytle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
