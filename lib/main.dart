import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily:GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.blue,

      ),
      home:homepage(),
    );
  }

//Colors
static Color creamcolor=Color(0xfff5f5f5);
static Color bluecolor=Color(0xff403B58);

}
