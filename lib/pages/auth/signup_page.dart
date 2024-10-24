import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import '../../components/custom_textfield.dart';
import '../../theme/app_colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfimController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
    _passwordConfimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.orange,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontFamily: 'Roboto-Bold', color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                // let's sign in
                const Text(
                  'Create your Account',
                  style: TextStyle(
                      color: AppColors.orange,
                      fontFamily: 'Roboto-Bold',
                      fontSize: 30),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Please enter your infomation.',
                  style: TextStyle(fontFamily: 'Roboto-Light', fontSize: 18),
                ),
                const SizedBox(height: 40),

                // textfields
                CustomTextfield(
                    controller: _emailController,
                    hintText: 'Email',
                    icon: Icons.email),
                const SizedBox(height: 10),
                CustomTextfield(
                    controller: _fullNameController,
                    hintText: 'Full Name',
                    icon: Icons.lock),
                const SizedBox(height: 10),
                CustomTextfield(
                    controller: _passwordController,
                    hintText: 'Password',
                    icon: Icons.lock),
                const SizedBox(height: 10),
                CustomTextfield(
                    controller: _passwordConfimController,
                    hintText: 'Password confirmation',
                    icon: Icons.lock),
                const SizedBox(height: 20),

                // buttons
                CustomButton(
                    onTap: () {}, color: AppColors.orange, btnText: 'Register'),
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
                        style:
                            TextStyle(fontFamily: 'Roboto-Bold', fontSize: 20),
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
                CustomButton(
                    onTap: () {
                      Navigator.pop(context);
                    }, color: AppColors.black, btnText: 'Sign In'),
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
    );
  }
}
