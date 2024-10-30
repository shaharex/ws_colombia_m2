// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ws_colombia_m2/components/custom_textfield.dart';

import 'package:ws_colombia_m2/pages/auth/login_page.dart';
import 'package:ws_colombia_m2/pages/auth/password_reset_page.dart';
import 'package:ws_colombia_m2/pages/auth/signup_page.dart';
import 'package:ws_colombia_m2/pages/home/home_page.dart';

void main() {
  testWidgets("Login Page Text displays correctly",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    expect(find.text("USED ZIP"), findsOneWidget);
    expect(find.text("Sign in"), findsOneWidget);
    expect(find.text("Sign Up"), findsOneWidget);
    expect(find.text("Password Reset"), findsOneWidget);
  });

  testWidgets("Textfields contain data", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    await tester.enterText(find.byType(CustomTextfield).at(0), 'emilys');
    await tester.enterText(find.byType(CustomTextfield).at(1), 'emilyspass');
  });

  testWidgets("Sign Up button navigates to SignUpPage",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    await tester.tap(find.text("Sign Up"));
    await tester.pumpAndSettle();

    expect(find.byType(SignUpPage), findsOneWidget);
  });

  testWidgets("Password Reset button navigates to Password Reset Page",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    await tester.tap(find.text("Password Reset"));
    await tester.pumpAndSettle();

    expect(find.byType(PasswordResetPage), findsOneWidget);
  });

  testWidgets("Home Page Text Displays", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage(token: 'woeio',)));

    expect(find.text("Korea - Go Yang"), findsOneWidget);
  });
}
