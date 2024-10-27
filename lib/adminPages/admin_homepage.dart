import 'package:NewsApp/adminPages/create_news.dart';
import 'package:NewsApp/decoration.dart/decoration_button.dart';
import 'package:NewsApp/return_appbar.dart';
import 'package:NewsApp/superadmin/addnewadmin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AdminHomePage extends StatefulWidget {
  String? email;
  AdminHomePage(this.email, {super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  // print()
  Widget build(BuildContext context) {
    print(widget.email);
    var ListviewItems = [
      {
        "title": "Add New News",
        "image": "assets/addnews.png",
        "imgsize": '100',
        "onTap": "/createnews"
      },
      {
        "title": "Edit News",
        "image": "assets/editnews.png",
        "imgsize": '80',
        "onTap": "/editnews"
      },
      {
        "title": "Delete News",
        "image": "assets/deletenews.png",
        "imgsize": '120',
        "onTap": "/deletenews"
      },
      {
        "title": "Goto Home Page",
        "image": "assets/deletenews.png",
        "imgsize": '20',
        "onTap": "/homepage"
      }
    ];
    return Scaffold(
      appBar: AppBarr.appbar(),
      drawer: AppBarr.drawer(context),
      body: Container(
        color: Colors.black,
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 5, right: 5),
          alignment: Alignment.center,
          color: Colors.black,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10),
            itemCount: ListviewItems.length,
            itemBuilder: (context, index) {
              int height = int.parse(ListviewItems[index]['imgsize']!);

              double newhight = height.toDouble();
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ListviewItems[index]['title']!,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Image.asset(ListviewItems[index]['image']!,
                          height: newhight),
                      onTap: () {
                        if (ListviewItems[index]['onTap'] == "/createnews") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CreateNews(widget.email!)));
                        } else {
                          Navigator.pushNamed(
                              context, ListviewItems[index]['onTap']!);

                          print(ListviewItems[index]['image']!);
                        }
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
