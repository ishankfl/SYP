import 'package:NewsApp/adminPages/admin_edit_news.dart';
import 'package:NewsApp/adminPages/admin_login.dart';
import 'package:NewsApp/adminPages/create_news.dart';
import 'package:NewsApp/newsApp/category_display.dart';
import 'package:NewsApp/superadmin/login_super_admin.dart';
import 'package:NewsApp/superadmin/superadminhome.dart';
import 'package:flutter/material.dart';
// import 'package:sendimage/createnews.dart';

void main(List<String> args) {
  runApp(MaterialApp(
      // home: NewsDisplay(),
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      initialRoute: '/createnews',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget   .
        '/': (context) => AdminLogin(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/adminLogin': (context) => const AdminLogin(),
        '/createnews': (context) => CreateNews(
            "Hello"), // It has value in constructor so i remove from it
        '/superadminlogin': (context) => const SuperAdminLogin(),
        '/superadminhome': (context) => const SuperAdminHome(),
        '/editnews': (context) => const AdminEditNews(),
        '/category_page': (context) => const CategoryWise()
      }));
}

// class ShrastaLogin extends StatefulWidget {
//   const ShrastaLogin({super.key});

//   @override
//   State<ShrastaLogin> createState() => _ShrastaLoginState();
// }

// class _ShrastaLoginState extends State<ShrastaLogin> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         child: Stack(alignment: AlignmentDirectional.topCenter, children: [
//           Image.asset("assets/sra.PNG"),
//           Positioned(
//               child: Container(
//             margin: EdgeInsetsDirectional.only(top: 400),
//             height: 400,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(60),
//                     topRight: Radius.circular(60)),
//                 color: Colors.white),
//           ))
//         ]),
//       ),
//     );
//   }
// }
