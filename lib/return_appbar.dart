import 'package:NewsApp/adminPages/admin_login.dart';
import 'package:NewsApp/colortheme.dart';
import 'package:NewsApp/newsApp/category_display.dart';
import 'package:NewsApp/newsApp/newsdisplay.dart';
import 'package:NewsApp/superadmin/login_super_admin.dart';
import 'package:flutter/material.dart';

class AppBarr {
  static appbar() {
    var appbar = AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        "Click Dharan",
        style: TextStyle(fontSize: 25),
      ),
    );

    return appbar;
  }

  @override
  static Widget drawer(BuildContext context) {
    var appbarJson = [
      {'title': 'Category', 'icon': '', 'onTap': '/category'},
      {'title': 'Category', 'icon': '', 'onTap': '/adminpage'},
      {'title': 'Category', 'icon': '', 'onTap': '/superadminpage'},
      {'title': 'Category', 'icon': '', 'onTap': 'homepage'},
      {'title': 'Category', 'icon': '', 'onTap': 'aboutus'},
      {'title': 'Category', 'icon': '', 'onTap': 'nepali'}
    ];
    var textstyle = TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 2);
    typesofcategory() {
      var drawerMain = ListView.builder(
          itemCount: appbarJson.length,
          itemBuilder: (context, snatp) {
            return Row(
              children: [
                Text(
                  appbarJson[snatp]['title']!,
                  style: textstyle,
                )
              ],
            );
          });
      return drawerMain;
    }

    var drawer = Drawer(
        backgroundColor: ChooseColor.colorfulgreenblue(),
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Click Dharan",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 3,
              // color: Colors.red,
              width: 250,
              decoration: BoxDecoration(color: Colors.green),
            ),
            // Container(
            //   child: ListView.builder(
            //       itemCount: appbarJson.length,
            //       itemBuilder: (context, snatp) {
            //         return Row(
            //           children: [
            //             Text(
            //               appbarJson[snatp]['title']!,
            //               style: textstyle,
            //             )
            //           ],
            //         );
            //       }),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryWise()));
                  },
                  child: Text(
                    "Category",
                    style: textstyle,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AdminLogin()));

                    Colors.red;
                  },
                  child: Text(
                    "Admin Page",
                    style: textstyle,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Colors.red;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuperAdminLogin()));
                  },
                  child: Text(
                    "Super Admin Page",
                    style: textstyle,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (NewsDisplay())));
                    Colors.red;
                  },
                  child: Text(
                    "Home Page",
                    style: textstyle,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Colors.red;
                  },
                  child: Text(
                    "About Us",
                    style: textstyle,
                  ),
                )
              ],
            )
          ],
        )));

    return drawer;
  }
}
