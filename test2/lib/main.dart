import 'package:flutter/material.dart';
import 'package:test2/Pages/LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test2/Utilitis/routes.dart';
import 'Pages/HomePage.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: SafeArea(
        child: MyTheme(),
      ),
    ),
  );
}

bool flag = true;

class MyTheme extends StatelessWidget {
  const MyTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          fontFamily: GoogleFonts.lato().fontFamily),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homePageRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }

  // String intialRout() {
  //   String value = "";
  //   if (!flag) {
  //     value = Routes.initialRoute;
  //   } else {
  //     value = Routes.loginRoute;
  //   }
  //   return value;
  // }
}
