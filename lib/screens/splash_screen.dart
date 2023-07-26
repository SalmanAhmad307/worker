import 'dart:async';

import 'package:flutter/material.dart';
import 'package:worker/screens/worker_screen/login-screen.dart';

import 'home_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context)=>const HomeScreen())));


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.teal,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white60,
                      child: ClipOval(child: Image.asset(
                        'assets/images/worker.ico',
                        fit: BoxFit.cover,
                      ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const Text(
                      'Find Worker Near You',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        )

                    ),
                  ]
              ),
            ),
          )
      ),
    );
  }
}
