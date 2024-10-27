import 'package:NewsApp/adminPages/admin_homepage.dart';
import 'package:NewsApp/adminPages/adminmodel.dart';
import 'package:NewsApp/ipaddress.dart';
import 'package:NewsApp/return_appbar.dart';
import 'package:NewsApp/superadmin/superadminhome.dart';
import 'package:flutter/material.dart';
import 'package:NewsApp/colortheme.dart';
import 'package:NewsApp/login_add_design.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  var objcolor = ChooseColor();
  var lableandfield = LoginAddDesign();
  String? Oldemail;

  login_admin_(String email, String password) async {
    this.Oldemail = email;
    AdminModel newemail = AdminModel();

    try {
      var ip = Ipaddress.ipaddress;
      String url = "http://" + ip + "/clickdharan/adminlogincheck.php";
      var uri = Uri.parse(url);
      var data = {'email': email, 'password': password};
      var response = await http.post(uri, body: data);
      // print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Successfully Login");
        newemail.setEmail(email);

        // print("Main Admin Page");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AdminHomePage(email)));
      } else {
        Fluttertoast.showToast(msg: "Error to Login. Please try again");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Please check the network connection");
      print("network error");
    }
  }

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    LoginAddDesign alldesing = LoginAddDesign();
    return Scaffold(
      backgroundColor: objcolor.blacktheme(),

      appBar: AppBarr.appbar(),
      drawer: AppBarr.drawer(context),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(children: [
            alldesing.varBigText("LOGIN"),
            alldesing.varSmallText("as admin"),
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
                    border: Border.all(
                        width: 3, color: ChooseColor.colorfulgreenblue()),
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
                            controller: emailController,
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
                            controller: passwordController,
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
                                onTap: () {
                                  String email = emailController.text.trim();
                                  String password =
                                      passwordController.text.trim();
                                  if (email.isEmpty || password.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Please fill the all fields");
                                    return;
                                  }
                                  login_admin_(email, password);
                                },
                                child:
                                    // child: Container(
                                    //     alignment: Alignment.center,
                                    //     height: 50,
                                    //     width: 200,
                                    //     decoration: BoxDecoration(
                                    //         color: Color.fromARGB(255, 34, 179, 211),
                                    //         borderRadius: BorderRadius.circular(10)),
                                    //     child: Text(
                                    //       "Login",
                                    //       style: TextStyle(
                                    //           fontWeight: FontWeight.bold,
                                    //           fontSize: 20),
                                    //     )),
                                    alldesing.workonutton('Login')),
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
                        border: Border.all(
                            width: 3, color: ChooseColor.colorfulgreenblue()),
                        color: objcolor.blacktheme()),
                    child: Icon(
                      Icons.person,
                      color: ChooseColor.colorfulgreenblue(),
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
