import 'dart:convert';

import 'package:NewsApp/adminPages/admin_homepage.dart';
import 'package:NewsApp/adminPages/adminmodel.dart';
import 'package:NewsApp/decoration.dart/decoration_button.dart';
import 'package:NewsApp/ipaddress.dart';
import 'package:NewsApp/return_appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:NewsApp/colortheme.dart';
import 'package:NewsApp/login_add_design.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class CreateNews extends StatefulWidget {
  String email;
  CreateNews(this.email, {super.key});

  @override
  State<CreateNews> createState() => _CreateNewsState();
}

class _CreateNewsState extends State<CreateNews> {
  var colortheme = ChooseColor();
  var lableandformfield = LoginAddDesign();

  @override
  Widget build(BuildContext context) {
    int index = 0;
    print(widget.email);
    List<String> dropdownVaalues = [
      "Social",
      "Sport",
      "Politic",
      "Economic",
      "Local"
    ];
    List<DropdownMenuItem<String>> dropdownItems = [];
    String? valueChoose;
    if (valueChoose == null) {
      valueChoose = "Social";
    }
    for (String value in dropdownVaalues) {
      dropdownItems.add(DropdownMenuItem(
        // key: Key("value"),

        key: Key(
          AutofillHints.transactionCurrency,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          value,
          style: TextStyle(color: Color.fromARGB(255, 190, 90, 90)),
        ),
        value: value,
      ));
    }

    var headingController = TextEditingController();
    var contentController = TextEditingController();
    // AdminModel addmodel = new AdminModel();
    // String? emaill = addmodel.getEmail();
    print("This is email");
    // print(emaill);

    return Scaffold(
      appBar: AppBarr.appbar(),
      drawer: AppBarr.drawer(context),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "CREATE A NEWS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 20,
                    // ),
                    lableandformfield.varLabel("Heading"),
                    // Text("Heading"),
                    TextField(
                        controller: headingController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Heading",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2)),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    lableandformfield.varLabel("Content"),

                    TextField(
                        controller: contentController,
                        style: TextStyle(color: Colors.white),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(23),

                          hintText: "hinttext",

                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2)),
                          // contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          // isDense: true,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        lableandformfield.varLabel("Category"),
                        SizedBox(
                          width: 40,
                        ),
                        DropdownButton(
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            hint: Container(
                              margin: EdgeInsets.only(
                                left: 20,
                              ),
                              alignment: Alignment.center,
                              child: Text(valueChoose),
                            ),
                            focusNode: FocusNode(),
                            style: TextStyle(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            iconDisabledColor: Colors.white,
                            focusColor: Colors.red,
                            dropdownColor: Colors.white,
                            value: dropdownVaalues[index],
                            onChanged: (newValue) {
                              for (int i = 0; i < dropdownVaalues.length; i++) {
                                if (newValue == dropdownVaalues[i]) {
                                  index = i;
                                  // setState(() {});

                                  continue;
                                } else {
                                  // print(newValue);
                                  // print(dropdownItems);
                                  // print(i);
                                }
                              }
                              // // print(newValue);
                              // print(newValue);
                            },
                            items: dropdownItems),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    InkWell(
                        onTap: () {
                          sendNews(String heading, String content,
                              String cate) async {
                            DateTime now = new DateTime.now();
                            DateTime date =
                                new DateTime(now.year, now.month, now.day);
                            String fulldate = now.year.toString() +
                                "-" +
                                now.month.toString() +
                                "-" +
                                now.day.toString();
                            try {
                              String url = "http://" +
                                  Ipaddress.ipaddress +
                                  "/ClickDharan/addnews.php";
                              Uri uri = Uri.parse(url);
                              var response = await http.post(uri, body: {
                                "heading": heading,
                                "content": content,
                                "category": cate,
                                "writer": widget.email,
                                "date": fulldate
                              });
                              print(response.statusCode);
                              if (response.statusCode == 200) {
                                Fluttertoast.showToast(
                                    msg: "Successfully Added News");
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            AdminHomePage(widget.email)));
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Failed to Upload News");
                              }
                            } catch (e) {
                              print(e);
                            }
                          }

                          sendNews(headingController.text,
                              contentController.text, valueChoose!);
                        },
                        child: ButtonDecoration.submitbtn("Upload"))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
