import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ws_colombia_m2/components/custom_button.dart';
import 'package:ws_colombia_m2/components/custom_card.dart';

import '../../theme/app_colors.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key, required this.token});
  final String token;

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final dio = Dio();
  bool isLoading = true;

  // user data
  dynamic user;

  void getUserInfo() async {
    try {
      final header = {'Authorization': 'Bearer ${widget.token}'};
      final response = await dio.get('https://dummyjson.com/auth/me',
          options: Options(headers: header));

      setState(() {
        user = response.data;
        isLoading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.orange,
        title: const Text(
          'User Profile Page',
          style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 22,
              color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: isLoading ? const CircularProgressIndicator() : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
              
                children: [
                  const SizedBox(height: 50),
                  CircleAvatar(
                    radius: 50,
                    child: Image.network(user['image']),
                  ),
                  Text(user['username'], style: const TextStyle(fontFamily: 'Roboto-Bold', fontSize: 30),),
                  const SizedBox(height: 30,),
                  CustomCard(suffix: 'Email: ', prefix: user['email']),
                  const SizedBox(height: 15),
                  CustomCard(suffix: 'First Name:', prefix: user['firstName']),
                  const SizedBox(height: 15),
                  CustomCard(suffix: 'Last Name:', prefix: user['lastName']),
                  const SizedBox(height: 15),
                  CustomCard(suffix: 'Gender:', prefix: user['gender']),
                ],
              ),
              CustomButton(onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              }, color: AppColors.orange, btnText: 'Sign Out'),
            ],
          ),
        ),
      ),
    );
  }
}
