// import 'package:sigacred/views/signInView.dart';
import 'package:flutter/material.dart';
import 'package:sigacred/views/home.view.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SplashScreenView(
          navigateRoute: HomeView(),
          duration: 3000,
          text: "Siga Cred",
          textType: TextType.TyperAnimatedText,
          textStyle: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
