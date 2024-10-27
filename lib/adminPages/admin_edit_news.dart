import 'dart:convert';
import 'package:NewsApp/adminPages/create_news.dart';
import 'package:NewsApp/adminPages/edit_news.dart';
import 'package:NewsApp/ipaddress.dart';
import 'package:NewsApp/newsApp/particularnews.dart';
import 'package:NewsApp/return_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AdminEditNews extends StatefulWidget {
  const AdminEditNews({super.key});

  @override
  State<AdminEditNews> createState() => _AdminEditNewsState();
}

// FetchNews fetchNewsObj = new FetchNews();
class _AdminEditNewsState extends State<AdminEditNews> {
  var data = [];

  Future<Object?> returnnews() async {
    // ignore: prefer_interpolation_to_comose_strings
    var url = "http://" + Ipaddress.ipaddress + "/ClickDharan/fetchnews.php";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    data = jsonDecode(response.body);
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
              return RefreshIndicator(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      // padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        style: ListTileStyle.list,
                        contentPadding: EdgeInsets.all(2),
                        // isThreeLine: true,
                        // shape: ShapeBorder.lerp(10, 100),
                        tileColor: Colors.black,

                        trailing: Column(
                          children: [
                            InkWell(
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  print("Eorr");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditNews(
                                                data[index]['newsHeading']!,
                                                data[index]['newsHeading']!,
                                              )));
                                }),
                            SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              onTap: () {
                                deleteNews(String newsid) async {
                                  print("tapped");
                                  String url = "http://" +
                                      Ipaddress.ipaddress +
                                      "/ClickDharan/deletenews.php?id=" +
                                      newsid;

                                  print(url);
                                  //  "/ClickDharan/fetchnews.php";
                                  Uri uri = Uri.parse(url);
                                  var response = await http.get(uri);
                                  print(response.body);
                                  // data = jsonDecode(response.body);
                                  print(response.statusCode);
                                  if (response.statusCode == 200) {
                                    Fluttertoast.showToast(
                                        msg: "Successfully deleted news");
                                  }
                                  // return data;
                                  setState(() {});
                                }

                                deleteNews(data[index]['news_Id']);
                              },
                            )
                          ],
                        ),

                        title: Container(
                          height: 120,
                          width: MediaQuery.of(context).size.height * 80 / 100,
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.white)),
                            color: Color.fromARGB(255, 2, 12, 18),
                          ),
                          child: Text(
                            "${data[index]['newsHeading']}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 252, 252, 252),
                                fontSize: 20),
                          ),
                        ),
                      ),
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
    );
  }
}
