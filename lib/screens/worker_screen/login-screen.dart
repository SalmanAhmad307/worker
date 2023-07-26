import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ndialog/ndialog.dart';
import 'package:worker/screens/worker_screen/register_screen.dart';
import 'package:worker/screens/worker_screen/worker_home.dart';

import '../../models/user_model.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key,}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var newEmailController=TextEditingController();
  var passwordOb=true;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        // appBar: AppBar(
        //   title: const Text(
        //       'Login Screen',
        //     style: TextStyle(
        //       fontSize: 15,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.white,
        //     ),
        //   ),
        //   backgroundColor: Colors.teal,
        //   centerTitle: true,
        // ),

        body:
        SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
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
                    'Worker Login ',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                const SizedBox(height: 20,),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding:const EdgeInsets.fromLTRB(20,10,20,10),
                    filled: true,
                    fillColor:Colors.white,
                    hintText: 'Email',
                    suffix: const Icon(Icons.email,color: Colors.teal,),
                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),


                ),
                const SizedBox(height: 10,),
                TextField(
                    obscureText: passwordOb,
                    controller: passwordController,

                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.fromLTRB(20,10,20,10),
                      filled: true,
                      fillColor:Colors.white,
                      hintText: 'Password',focusColor: Colors.white,
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            passwordOb = !passwordOb;
                          });
                        },
                        icon: Icon(
                            passwordOb ?
                            Icons.visibility_off: Icons.visibility
                        ),
                        focusColor: Colors.teal,
                        color: Colors.teal,
                      ),
                    )
                ),

                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: ElevatedButton(
                    onPressed:()async{
                    var email=emailController.text;
                    var password=passwordController.text;
                    FirebaseAuth auth=FirebaseAuth.instance;
                    if(email.isNotEmpty&&password.isNotEmpty){

                      ProgressDialog progress=ProgressDialog(
                        context,
                        title: const Text('Loging'),
                        message: const Text(
                          'Please Wait',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                        dialogTransitionType: DialogTransitionType.Bubble,
                        dialogStyle: DialogStyle(
                          contentPadding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                          contentTextStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          backgroundColor: Colors.teal,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          titleTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          elevation: 24,
                        )
                      );
                      progress.show();
                      FirebaseAuth firebaseAuth=FirebaseAuth.instance;

                      try{

                        UserCredential userCredential=await firebaseAuth.signInWithEmailAndPassword(
                            email: email,
                            password: password
                        );
                         User? user=userCredential.user;
                         if(User!=null){
                           progress.dismiss();
                           Fluttertoast.showToast(msg: 'LogIn Successfully');
                           Get.to(  HomeWorker());
                         }


                      } on FirebaseAuthException catch(e){
                        progress.dismiss();
                        if(e.code == 'user-not-found'){
                          Fluttertoast.showToast(msg: 'User is not exit');
                        }else if(e.code == 'wrong-password'){
                          Fluttertoast.showToast(msg: 'your password not correct');

                        }
                      }

                    }else{
                      Fluttertoast.showToast(msg: 'Both is must will be filled');
                    }
                      Get.to( HomeWorker());


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
                      'Login',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),

                  ),
                ),

                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account?",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white60,
                      ),

                    ),
                    // ElevatedButton(
                    //
                    //     onPressed: (){
                    //       Get.to(const RegisterScreen());
                    //
                    //     },
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.teal,
                    //     shape: const RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.only(
                    //         topRight: Radius.circular(15),
                    //         bottomLeft: Radius.circular(15),
                    //
                    //       ),
                    //     ),
                    //   ),
                    //     child:  const Text(
                    //         'Register here',
                    //       style: TextStyle(
                    //         fontSize: 15,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //
                    // ),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: (){
                          Get.to(const RegisterScreen());

                        },

                          child: const Text(
                              'Register',
                            style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                          ),
                      )

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
