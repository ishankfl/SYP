import 'package:NewsApp/decoration.dart/decoration_button.dart';
import 'package:NewsApp/ipaddress.dart';
import 'package:NewsApp/return_appbar.dart';
import 'package:flutter/material.dart';
import 'package:NewsApp/colortheme.dart';
import 'package:NewsApp/login_add_design.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class EditNews extends StatefulWidget {
  String heading;
  String content;
  EditNews(this.heading, this.content, {super.key});

  @override
  State<EditNews> createState() => _EditNewsState();
}

class _EditNewsState extends State<EditNews> {
  var colortheme = ChooseColor();
  var lableandformfield = LoginAddDesign();

  @override
  Widget build(BuildContext context) {
    // print(widget.email);
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

    var headingController = TextEditingController(text: widget.heading);
    var contentController = TextEditingController(text: widget.content);
    print("This is email");
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
              "Edit a news",
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
                    lableandformfield.varLabel("Heading"),
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

                          hintText: "content",

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
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10),
                            // color,
                          ),
                          child: DropdownButton(
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
                              value: valueChoose,
                              onChanged: (newValue) {
                                valueChoose = newValue;
                              },
                              items: dropdownItems),
                        ),
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
                                  "/ClickDharan/editnews.php";
                              Uri uri = Uri.parse(url);
                              var response = await http.post(uri, body: {
                                "heading": heading,
                                "content": content,
                                "category": cate,
                                "date": fulldate
                              });
                              print(response.statusCode);
                              if (response.statusCode == 200) {
                                Fluttertoast.showToast(
                                    msg: "Successfully Edit News");
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (builder) =>
                                //             AdminHomePage(widget.email)));
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Failed to Edit News");
                              }
                            } catch (e) {
                              print(e);
                            }
                          }

                          sendNews(headingController.text,
                              contentController.text, valueChoose!);
                        },
                        child: ButtonDecoration.submitbtn("Edit"))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
