import 'dart:convert';
import 'package:NewsApp/ipaddress.dart';
import 'package:NewsApp/newsApp/particularnews.dart';
import 'package:NewsApp/return_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class NewsDisplay extends StatefulWidget {
  const NewsDisplay({super.key});

  @override
  State<NewsDisplay> createState() => _NewsDisplayState();
}

// FetchNews fetchNewsObj = new FetchNews();
class _NewsDisplayState extends State<NewsDisplay> {
  var data = [];

  Future<Object?> returnnews() async {
    print("Newps ppem");
    try {
      var url = "http://" + Ipaddress.ipaddress + "/ClickDharan/fetchnews.php";
      print(url);
      Uri uri = Uri.parse(url);
      print(url);
      var response = await http.get(uri);
      // if(response.statusCode==200){
      //   Fluttertoast.showToast(msg: "Successfully added news");
      // }
      // else{
      //   Fluttertoast.showToast(msg: "Please try again");
      // }
      data = jsonDecode(response.body);
      print(data);
      print(data);
    } catch (e) {
      print(e);
    }
    // var url = "http://" + Ipaddress.ipaddress + "/ClickDharan/fetchnews.php";

    // Uri uri = Uri.parse(url);
    // print(url);
    // var response = await http.get(uri);
    // data = jsonDecode(response.body);

    // // data = returnnews();
    // print(data);
    return data;
  }

  // ReturnNews fetchnews=new ReturnNews();
  // data=returnnews();

  @override
  Widget build(BuildContext context) {
    returnnews();
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
                    // int count = 0;
                    // String? heading = "";
                    // for (int i = 0;
                    //     i < data[index]['newsHeading'].length;
                    //     i++) {
                    //   while (count < 80) {
                    //     heading = heading! + data[index]['newsHeading'][i];
                    //   }
                    // }
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
                            print(data[index]['writername']);
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
