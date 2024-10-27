import 'package:flutter/material.dart';

class ButtonDecoration {
  static btnDecoration(String buttonName) {
    return Container(
        alignment: Alignment.center,
        // height: 50,
        // width: 200,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Text(
          "Add New News",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ));
  }

  static submitbtn(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            alignment: Alignment.center,
            height: 50,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
      ],
    );
  }
}
