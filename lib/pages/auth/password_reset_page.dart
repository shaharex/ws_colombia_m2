import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import '../../components/custom_textfield.dart';
import '../../theme/app_colors.dart';
import 'signup_page.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameConfirmController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _passwordConfimController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _fullNameConfirmController.dispose();
    _newPasswordController.dispose();
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
          "Password Reset",
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
                  '******',
                  style: TextStyle(
                      color: Color.fromARGB(255, 202, 202, 202),
                      fontFamily: 'Roboto-Bold',
                      fontSize: 50),
                ),
                const SizedBox(height: 5),
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
                    controller: _fullNameConfirmController,
                    hintText: 'Full Name Confirm',
                    icon: Icons.lock),
                const SizedBox(height: 10),
                CustomTextfield(
                    controller: _newPasswordController,
                    hintText: 'New password',
                    icon: Icons.lock),
                const SizedBox(height: 10),
                CustomTextfield(
                    controller: _passwordConfimController,
                    hintText: 'Confirm password',
                    icon: Icons.lock),
                const SizedBox(height: 20),

                // buttons
                CustomButton(
                    onTap: () {}, color: AppColors.orange, btnText: 'Reset'),
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
                            Navigator.pop(context);
                          },
                          color: AppColors.black,
                          btnText: 'Sign In'),
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
    );
  }
}
