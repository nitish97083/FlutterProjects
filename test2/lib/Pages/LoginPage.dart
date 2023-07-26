// ignore_for_file: file_names, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:test2/Utilitis/CustomeTextStyle.dart';
import 'package:test2/Utilitis/GlobalVariable.dart';
import 'package:test2/Utilitis/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

movedToHome(BuildContext context) {
  if (_formKey.currentState!.validate()) {
    // Navigator.pushNamed(context, MyRoutes.homePageRoute);
  }
}

String user = "";

final _formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var ver = MediaQuery.of(context).size.height;
    var hor = MediaQuery.of(context).size.width;
    return Placeholder(
      child: Scaffold(
        appBar: app_bar(),
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    "assests/images/img1.jpg",
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                ),
              ),
              size_box(20, context),
              text("Welcome $user", TextAlign.center),
              size_box(20, context),
              text_Form_container(
                30.0,
                40.0,
                TextFormField(
                  validator: (value) {
                    value != null ? null : "User name can not be empty";
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ),
                  obscureText: false,
                  onChanged: (val) {
                    user = val;
                    setState(() {});
                  },
                ),
              ),
              text_Form_container(
                  30.0,
                  40.0,
                  TextFormField(
                    validator: (value) {
                      value != null ? null : "Password can not be empty";
                      value!.length < 6 ? null : "Password can not be empty";
                    },
                    decoration: InputDecoration(
                      hintText: "ENter password",
                      labelText: "Password",
                    ),
                    obscureText: true,
                    onChanged: (val) {
                      print("VAl $val");
                      setState(() {
                        GlobalVariable().username = val;
                      });
                    },
                  )),
              Material(
                color: Colors.red,
                child: InkWell(
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  focusColor: Colors.white60,
                  highlightColor: Colors.green,
                  onTap: () {
                    movedToHome(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
