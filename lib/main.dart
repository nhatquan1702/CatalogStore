import 'package:catalog_store/pages/home_page.dart';
import 'package:catalog_store/pages/home_page_new.dart';
import 'package:catalog_store/pages/login_page.dart';
import 'package:catalog_store/utils/routes.dart';
import 'package:catalog_store/widgets/theme.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePageNew(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}