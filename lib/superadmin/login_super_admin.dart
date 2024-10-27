import 'package:NewsApp/ipaddress.dart';
import 'package:NewsApp/return_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:NewsApp/colortheme.dart';
import 'package:NewsApp/login_add_design.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:NewsApp/superadmin/superadminhome.dart';

class SuperAdminLogin extends StatefulWidget {
  const SuperAdminLogin({super.key});

  @override
  State<SuperAdminLogin> createState() => _SuperAdminLoginState();
}

class _SuperAdminLoginState extends State<SuperAdminLogin> {
  var fToast;

  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  static var superadmin = '';
  var objcolor = ChooseColor();
  var lableandfield = LoginAddDesign();
  @override
  Widget build(BuildContext context) {
    TextEditingController superadminemailController = TextEditingController();
    TextEditingController superadminpwController = TextEditingController();
    loginSuperAdmin(String email, String pw) async {
      print("tapped");
      try {
        var ip = Ipaddress.ipaddress;
        String url = "http://" + ip + "/clickdharan/superadminlogin.php";
        var uri = Uri.parse(url);
        var data = {'email': email, 'password': pw};
        var response = await http.post(uri, body: data);
        print(response.statusCode);
        if (response.statusCode == 200) {
          print("Main Admin Page");
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SuperAdminHome()));
        }
      } catch (e) {
        Fluttertoast.showToast(msg: "Please check the network connection");
        print("network error");
      }
    }

    return Scaffold(
      backgroundColor: objcolor.blacktheme(),

      appBar: AppBarr.appbar(),
      drawer: AppBarr.drawer(context),

      body: SingleChildScrollView(
        child: Container(
          // decoration: BoxDecoration(color: Colors.white),
          margin: EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Column(children: [
            lableandfield.varBigText("LOGIN"),
            lableandfield.varSmallText("as super admin"),
            SizedBox(
              height: 30,
            ),
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 20),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.white),
                    // color: Colors.green,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        lableandfield.varLabel("Email"),
                        SizedBox(
                          height: 5,
                        ),
                        TextField(
                            controller: superadminemailController,
                            style: TextStyle(color: Colors.white),
                            decoration: lableandfield
                                .textfielddecoration("Enter your email here")),
                        SizedBox(
                          height: 20,
                        ),
                        lableandfield.varLabel("Password"),
                        SizedBox(
                          height: 5,
                        ),
                        TextField(
                            controller: superadminpwController,
                            style: TextStyle(color: Colors.white),
                            decoration: lableandfield
                                .textfielddecoration("Enter your password")),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                              onTap: () {
                                String email =
                                    superadminemailController.text.toString();
                                String pw =
                                    superadminpwController.text.toString();
                                if (email == "" || pw == "") {
                                  Fluttertoast.showToast(
                                    msg: "Please fill the all fields",
                                  );
                                } else if (email.isEmpty || pw.isEmpty) {
                                } else
                                  loginSuperAdmin(email, pw);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 3, color: Colors.white),
                        color: objcolor.blacktheme()),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // Text(
            //   "Don't have an account? Sign Up",
            //   style: TextStyle(color: Colors.white),
            // ),
          ]),
        ),
      ),
      // bottomNavigationBar: AppBar(title: Text("hello"),),
    );
  }
}
