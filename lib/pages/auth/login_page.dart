import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ws_colombia_m2/components/custom_button.dart';
import 'package:ws_colombia_m2/components/custom_textfield.dart';
import 'package:ws_colombia_m2/pages/auth/password_reset_page.dart';
import 'package:ws_colombia_m2/pages/auth/signup_page.dart';
import 'package:ws_colombia_m2/pages/home/home_page.dart';
import 'package:ws_colombia_m2/theme/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final dio = Dio();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signIn(BuildContext context) async {
    try {
      final data = jsonEncode({
        'username': _emailController.text,
        'password': _passwordController.text,
      });
      final response =
          await dio.post('https://dummyjson.com/auth/login', data: data);

      final token = response.data['accessToken'];

      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HomePage(token: token)));
    } catch (e) {
      debugPrint(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('this is the error: $e')));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: AppColors.orange,
        title: const Text(
          'USED ZIP',
          style: TextStyle(
              fontFamily: 'Roboto-Bold', fontSize: 30, color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // let's sign in
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/images/Grupo 14.png"),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Let's Sign in",
                    style: TextStyle(fontFamily: 'Roboto-Light', fontSize: 24),
                  ),
                  const SizedBox(height: 40),

                  // textfields
                  CustomTextfield(
                      controller: _emailController,
                      hintText: 'Email',
                      icon: Icons.email),
                  const SizedBox(height: 10),
                  CustomTextfield(
                      isObscure: true,
                      controller: _passwordController,
                      hintText: 'Password',
                      icon: Icons.lock),
                  const SizedBox(height: 20),

                  // buttons
                  CustomButton(
                      onTap: () => signIn(context),
                      color: AppColors.orange,
                      btnText: 'Sign in'),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: 2,
                          decoration: BoxDecoration(
                              color: AppColors.black,
                              borderRadius: BorderRadius.circular(2)),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'OR',
                          style: TextStyle(
                              fontFamily: 'Roboto-Bold', fontSize: 20),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: 2,
                          decoration: BoxDecoration(
                              color: AppColors.black,
                              borderRadius: BorderRadius.circular(2)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            },
                            color: AppColors.black,
                            btnText: 'Sign Up'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: CustomButton(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PasswordResetPage()));
                            },
                            color: AppColors.black,
                            btnText: 'Password Reset'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // worldskills icon
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
          ),
        ),
      ),
    );
  }
}
