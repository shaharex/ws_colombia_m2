import 'dart:async';

import 'package:flutter/material.dart';

import '../auth/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              children: [
                Text(
                  'Welcome to',
                  style: TextStyle(fontFamily: 'Roboto-Light', fontSize: 32),
                ),
                Text(
                  'USED ZIP',
                  style: TextStyle(fontFamily: 'Roboto-Bold', fontSize: 24),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 180,
                  height: 180,
                  child: Image.asset(
                    "assets/images/Grupo 14.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 45),
                const Text(
                  'Best used trading anywhere in the world.',
                  style: TextStyle(
                    fontFamily: 'Roboto-Light',
                    fontSize: 16
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: Image.asset(
                'assets/images/Imagen 4.png',
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
