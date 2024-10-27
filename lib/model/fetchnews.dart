import 'package:NewsApp/ipaddress.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var data = [];

class ReturnNews {
  static Future<Object?> returnnews() async {
    var url = "http://" + Ipaddress.ipaddress + "/ClickDharan/fetchnews.php";

    Uri uri = Uri.parse(url);

    var response = await http.get(uri);
    data = jsonDecode(response.body);

    // data = returnnews();
    print(data);
    return data;
  }
}
