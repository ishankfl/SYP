import 'dart:convert';
import 'package:NewsApp/ipaddress.dart';
import 'package:NewsApp/newsApp/particularnews.dart';
import 'package:NewsApp/return_appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryNews extends StatefulWidget {
  var category;
  CategoryNews(var category, {super.key}) {
    this.category = category;
  }
  @override
  State<CategoryNews> createState() => _CategoryNewsState(category);
}

// FetchNews fetchNewsObj = new FetchNews();
class _CategoryNewsState extends State<CategoryNews> {
  var data = [];
  var cate;
  _CategoryNewsState(String cate) {
    this.cate = cate;
  }

  Future<Object?> returnnews() async {
    var url = "http://" +
        Ipaddress.ipaddress +
        "/ClickDharan/categorywise.php?category=" +
        cate;

    Uri uri = Uri.parse(url);

    var response = await http.get(uri);
    data = jsonDecode(response.body);

    // data = returnnews();
    print(data);
    return data;
  }

  // ReturnNews fetchnews=new ReturnNews();
  // data=returnnews();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarr.appbar(),
      drawer: AppBarr.drawer(context),
      body: FutureBuilder(
          future: returnnews(),
          builder: (context, snapshot) {
            if (data != null) {
              // var length=0;
              return RefreshIndicator(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          child: Container(
                            height: 120,
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            // margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              // color: Color(0xffb74093)
                              color: Color.fromARGB(255, 2, 12, 18),
                              // borderRadius: BorderRadius.circular(12.0),
                            ),
                            // padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "${data[index]['newsHeading']}",
                              // textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 252, 252, 252),
                                  fontSize: 20),

                              // style: textSytle,
                            ),
                          ),
                          onTap: () {
                            // print(heading);

                            print(data[index]['newsHeading'].length);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ParticularNews(
                                          data[index]['newsHeading'],
                                          data[index]['newsContent'],
                                          data[index]['writername'],
                                          data[index]['Category'],
                                        )));
                          },
                        ),
                        Container(
                          height: 2,
                          color: Colors.white,
                        )
                      ],
                    );
                  },
                  physics: const AlwaysScrollableScrollPhysics(),
                ),
                onRefresh: () {
                  return Future.delayed(Duration(seconds: (3).toInt()), () {
                    setState(() {});
                  });
                },
              );
            } else {
              return const Text("Loading....");
            }
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     print("username");
      //     print(SignIn.SignIn.fusername);
      //     String newmessagesend = messagesendcontroller.text.toString();
      //     if (newmessagesend == "") {
      //     } else {
      //       senddata(newmessagesend);
      //       fetchdata();

      //       setState(() {});
      //     }
      //     print(ShowUsers.toemail);
      //     print(SignIn.SignIn.fusername);
      //   },
      //   child: Icon(Icons.send),
      //   backgroundColor: Color.fromARGB(255, 22, 161, 26),
      // ),
    );
  }
}
