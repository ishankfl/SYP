import 'package:NewsApp/ipaddress.dart';
import 'package:NewsApp/login_add_design.dart';
import 'package:NewsApp/return_appbar.dart';
import 'package:NewsApp/superadmin/superadminhome.dart';
import 'package:flutter/material.dart';
import 'package:NewsApp/return_appbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

class AddNewAdmin extends StatefulWidget {
  const AddNewAdmin({super.key});

  @override
  State<AddNewAdmin> createState() => _AddNewAdminState();
}

class _AddNewAdminState extends State<AddNewAdmin> {
  var smallBigtext = new LoginAddDesign();
  // var =new LoginAddDesign();

  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var superadminemailController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBarr.appbar(),
        drawer: AppBarr.drawer(context),
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  smallBigtext.varBigText("ADD"),
                  smallBigtext.varSmallText("writer"),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          smallBigtext.varLabel("Name"),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                              controller: fullnamecontroller,
                              style: TextStyle(color: Colors.white),
                              decoration: smallBigtext
                                  .textfielddecoration("Full Name of Admin")),
                          SizedBox(
                            height: 15,
                          ),
                          smallBigtext.varLabel("Email"),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                              controller: emailcontroller,
                              style: TextStyle(color: Colors.white),
                              decoration:
                                  smallBigtext.textfielddecoration("Email")),
                          SizedBox(
                            height: 15,
                          ),
                          smallBigtext.varLabel("Password"),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                              controller: passwordcontroller,
                              style: TextStyle(color: Colors.white),
                              decoration:
                                  smallBigtext.textfielddecoration("Password")),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: smallBigtext.workonutton("Add"),
                                onTap: () {
                                  addAdmin(
                                      fullnamecontroller.text,
                                      emailcontroller.text,
                                      passwordcontroller.text);
                                },
                              ),
                            ],
                          )
                        ]),
                  )
                ],
              )),
        ));
  }

  addAdmin(String fullname, String email, String password) async {
    try {
      var urlPath =
          "http://" + Ipaddress.ipaddress + "/ClickDharan/addadmin.php";
      var uri = Uri.parse(urlPath);
      var data = {'email': email, 'fullname': fullname, 'password': password};
      var response = await http.post(uri, body: data);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        // print("Successfully done");
        Fluttertoast.showToast(msg: "Successfully User Added");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SuperAdminHome()));
      } else if (response.statusCode == 400) {
        Fluttertoast.showToast(msg: "User Already registerd");

        print("Already registered");
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: "Network Connection Error");
    }
  }
}
