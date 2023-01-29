import 'package:flutter/material.dart';
import 'package:login_app/screens/home_screen.dart';
import 'package:login_app/screens/login.dart';
import 'package:login_app/screens/register.dart';
import 'package:login_app/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isIntrovisit = prefs.getBool("isIntrovisit") ?? false;
  bool? isLogin = prefs.getBool("isLogin") ?? false;
  bool? isRemember = prefs.getBool("isRemember") ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: (isIntrovisit == false)
          ? "splash"
          : (isLogin == false)
              ? "register"
              : (isRemember == false)
                  ? "Login"
                  : "/",
      routes: {
        "/": (context) => Home_page(),
        "register": (context) => Register_page(),
        "login": (context) => Login_page(),
        "splash": (context) => Splesh_screen(),
      },
    ),
  );
}
