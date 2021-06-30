import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigacred/views/splashscreen.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desafio SigaCred',
      theme: ThemeData(
        textTheme: GoogleFonts.ibmPlexSansTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
