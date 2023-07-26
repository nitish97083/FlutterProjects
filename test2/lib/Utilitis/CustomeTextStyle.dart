import 'package:flutter/material.dart';
import 'package:test2/Utilitis/GlobalVariable.dart';
import 'package:test2/Utilitis/routes.dart';

TextStyle text_style(
  var size,
) {
  return TextStyle(
    fontSize: 20.0,
  );
}

Widget size_box(var height, BuildContext context) {
  return SizedBox(height: MediaQuery.of(context).size.height / height);
}

Widget text(var text, TextAlign aline) {
  return Text(
    text,
    textAlign: aline,
    style: text_style(25),
  );
}

Widget text_filed(BuildContext context, var userName, var hintText,
    bool obscureText, var setState) {
  return TextFormField(
    decoration: InputDecoration(
      hintText: hintText,
      labelText: userName,
    ),
    obscureText: obscureText,
    onChanged: (val) {
      print("VAl $val");
      setState(() {
        GlobalVariable().username = val;
      });
    },
  );
}

// ignore: avoid_types_as_parameter_names, non_constant_identifier_names
Widget text_Form_container(var horizontal, var vertical, Widget widget) {
  return Container(
    color: Colors.amber,
    padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    child: widget,
  );
}

Widget elevated_button(String text, BuildContext context, var height) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / height),
    child: ElevatedButton(
      onPressed: () {
        print("Page Routing to Home Page");
        Navigator.pushNamed(context, MyRoutes.homePageRoute);
      },
      style: TextButton.styleFrom(),
      child: Container(child: Text(text), padding: EdgeInsets.all(10)),
    ),
  );
}

AppBar app_bar() {
  return AppBar(
    title: Title(
        color: Colors.orange,
        // ignore: prefer_const_constructors
        child: Container(
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text("data"), Text("data")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text("Best"), Text("Best")],
              ),
            ],
          ),
        )),
  );
}
