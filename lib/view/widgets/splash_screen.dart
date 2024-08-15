import 'package:app_users/view/widgets/main_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3))
        .then((value) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainHome()),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo.png",
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 15,
            ),
            const SpinKitFadingCube(
              color: Color.fromARGB(255, 22, 121, 171),
              size: 32,
            )
          ],
        ),
      ),
    );
  }
}
