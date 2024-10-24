import 'package:flutter/material.dart';
import 'package:ws_colombia_m2/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        toolbarHeight: 60,
        title: Text('Korea - Go Yang', style: TextStyle(fontFamily: 'Roboto-Bold', color: AppColors.white, fontSize: 26),),
        centerTitle: true,
        leading: Icon(Icons.search, color: Colors.white, size: 35,),
        actions: const [
          Icon(Icons.notifications_active, color: AppColors.white, size: 35,),
          SizedBox(width: 10,)
        ],

      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.asset("assets/images/Imagen 18.png"),
            ),
            
          ],
        ),
      ),
    );
  }
}