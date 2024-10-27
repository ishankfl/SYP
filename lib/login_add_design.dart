import 'package:NewsApp/colortheme.dart';
import 'package:flutter/material.dart';

class LoginAddDesign {
  textfielddecoration(String hinttext) {
    var textfielddecoration = InputDecoration(
      // contentPadding: const EdgeInsets.all(23),

      hintText: hinttext,

      hintStyle: const TextStyle(color: Colors.white),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.white,
      )),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isDense: true,
    );
    return textfielddecoration;
  }

  varLabel(String label) {
    var varLabel = Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
    return varLabel;
  }

  varBigText(String text) {
    var ntext = Text(
      text,
      style: TextStyle(
          color: ChooseColor.colorfulgreenblue(),
          fontSize: 40,
          fontFamily: "Lato",
          fontWeight: FontWeight.w600),
    );
    return ntext;
  }

  varSmallText(String text) {
    var ntext = Text(
      text,
      style: TextStyle(
        color: ChooseColor.colorfulgreenblue(),
        fontSize: 18,
      ),
    );

    return ntext;
  }

  workonutton(String text) {
    var container = Container(
        alignment: Alignment.center,
        height: 50,
        width: 200,
        decoration: BoxDecoration(
            color: ChooseColor.colorfulgreenblue(),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ));
    return container;
  }
}

// BoxDecoration(
//                                       color: Color.fromARGB(255, 34, 179, 211),
//                                       borderRadius: BorderRadius.circular(10)),