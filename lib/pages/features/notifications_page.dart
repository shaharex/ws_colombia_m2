import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.orange,
        title: const Text(
          'Notifications',
          style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 22,
              color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            const Text(
              'Messages',
              style: TextStyle(
                  color: AppColors.orange,
                  fontFamily: 'Roboto-Bold',
                  fontSize: 28),
            ),
            const SizedBox(height: 20),
            const Text(
              'Please enter your information.',
              style: TextStyle(fontFamily: 'Roboto-Light', fontSize: 18),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ListView.separated(
                  itemCount: 4,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      height: 80,
                      decoration: BoxDecoration(
                          color: AppColors.whiteLightShade,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 3,
                                spreadRadius: 3,
                                offset: const Offset(1, 3))
                          ]),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.person, color: Colors.grey, size: 35,),
                              Icon(Icons.mail, color: Colors.grey),
                            ],
                          ),
                           SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '@eburras1q',
                                style: TextStyle(
                                    fontFamily: 'Roboto-Bold', fontSize: 20),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "What terrific math skills you're showing",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontFamily: 'Roboto-Regular', fontSize: 16),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
