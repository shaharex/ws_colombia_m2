import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../pages/home/home_page.dart';

class AuthService {
  void signIn(BuildContext context, TextEditingController emailController, TextEditingController passwordController) async {
    final dio = Dio();

    try {
      final data = jsonEncode({
        'username': emailController.text,
        'password': passwordController.text,
      });
      final response =
          await dio.post('https://dummyjson.com/auth/login', data: data);

      final token = response.data['accessToken'];

      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HomePage(token: token)));
    } catch (e) {
      debugPrint(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please fill the acutal information')));
    }
  }
}