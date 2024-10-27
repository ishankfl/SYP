import 'package:NewsApp/login_add_design.dart';
import 'package:NewsApp/return_appbar.dart';
import 'package:NewsApp/superadmin/addnewadmin.dart';
import 'package:flutter/material.dart';

class SuperAdminHome extends StatefulWidget {
  const SuperAdminHome({super.key});

  @override
  State<SuperAdminHome> createState() => _SuperAdminHomeState();
}

class _SuperAdminHomeState extends State<SuperAdminHome> {
  var bigandsmalltext = new LoginAddDesign();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarr.appbar(),
      drawer: AppBarr.drawer(context),
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          bigandsmalltext.varBigText("Welcome"),
          bigandsmalltext.varSmallText("super Admin"),
          SizedBox(
            height: 50,
          ),
          InkWell(
            child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Add New Admin",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AddNewAdmin()));
            },
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Remove Admin",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            // onTap: () {
            //   String email =
            //       superadminemailController.text.toString();
            //   String pw =
            //       superadminpwController.text.toString();
            //   if (email == "" || pw == "") {
            //     Fluttertoast.showToast(
            //       msg: "Please fill the all fields",
            //     );
            //   } else if (email.isEmpty || pw.isEmpty) {
            //   } else
            //     loginSuperAdmin(email, pw);
            // },
          ),
        ]),
      )),
    );
  }
}
