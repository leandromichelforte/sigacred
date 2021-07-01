import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigacred/models/constants.model.dart';
import 'package:sigacred/views/home.view.dart';
import 'package:sigacred/views/newOrdem.view.dart';
import 'package:sigacred/views/ordemDetail.view.dart';
import 'package:sigacred/views/splashscreen.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.homeView: (context) => HomeView(),
        Routes.newOrdemView: (context) => NewOrdemView(),
        Routes.ordemDetailsView: (context) => OrdemDetailsView(),
      },
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
