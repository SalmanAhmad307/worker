import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:worker/screens/searcher_screens/Searcher_home_screen.dart';
import 'package:worker/screens/searcher_screens/user_type.dart';
import 'package:worker/screens/worker_screen/login-screen.dart';

import '../models/user_model.dart';
class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Padding(
          padding: const EdgeInsets.only(
            bottom: 15,
            left: 15,
            right: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white60,
                child: ClipOval(child: Image.asset(
                  'assets/images/worker.ico',
                  fit: BoxFit.cover,

                ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text(
                'Find Worker '
                    ' Near You',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),

              ),

              const SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                ),
                child: ElevatedButton(
                  onPressed:(){
                    Get.to(const LoginScreen());

                  },
                  // style: ElevatedButton.styleFrom(
                  //   backgroundColor: Colors.teal,
                  //   shape: const RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.only(
                  //       topRight: Radius.circular(15),
                  //       bottomLeft: Radius.circular(15),
                  //
                  //     ),
                  //   ),
                  // ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states){
                        if(states.contains(MaterialState.pressed)){
                          return Colors.teal;

                        }
                        return Colors.white;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )
                      )
                  ),
                  child:const Text(
                    'Signing As Worker',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),

                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                ),
                child: ElevatedButton(
                  onPressed:(){
                    Get.to(const BusinessType());

                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states){
                        if(states.contains(MaterialState.pressed)){
                          return Colors.teal;

                        }
                        return Colors.white;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )
                      )
                  ),
                  child:const Text(
                    'Signing As Searcher',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),

                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
