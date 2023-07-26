import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';
import 'package:worker/screens/worker_screen/login-screen.dart';

import 'my_loction.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool readOnly=false;
  /// Determine the current position of the device.
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.



  var fullNnameController=TextEditingController();
  var newBusinessController=TextEditingController();
  var newEmailController=TextEditingController();
  var newMobileNoController=TextEditingController();
  var newAddressController=TextEditingController();
  var newLocationController=TextEditingController();
  var newPasswordController=TextEditingController();
  var newConfrimPasswordController=TextEditingController();
  var passwordOb = true;
  var confirmPasswordOb = true;
  final workerType=TextEditingController();
  String selectType='';

  var myKey=GlobalKey<FormState>();
  var name,email,mobileNo,address,location,password,confrimPassword, business;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.teal,
        // appBar: AppBar(
        //   title: const Text(
        //       'Register Screen',
        //     style: TextStyle(
        //       fontSize: 15,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.white,
        //     ),
        //   ),
        //   backgroundColor: Colors.teal,
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: myKey,
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white60,
                      child: ClipOval(
                        child: Image.asset(
                        'assets/images/worker.ico',
                        fit: BoxFit.cover,
                      ),
                      ),
                    ),
                  ),
                         const SizedBox(height: 20,),
                         const Text(
                          'Worker Registration ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                  const SizedBox(height: 40,),
                  TextFormField(

                    controller: fullNnameController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    cursorColor: Colors.white,
                    decoration:const InputDecoration(
                      hintText: 'enter worker name',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      fillColor: Colors.white,
                      label: Text('Worker Name',style:TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),

                      validator: (value){
                        if(value!.isEmpty||!RegExp(r'^[a-zA-Z\s]*$',).hasMatch(value)){
                          return 'please provide your name';
                        }else{
                          name=value;
                          return null;
                        }
                      },
                  ),
                  const SizedBox(height: 20,),
                  SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal,
                      ),
                      child: DropDownField(
                        controller: workerType,
                        items:businessType,
                        hintText: 'Select Business Type',
                        labelText: 'Business Type',
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        onValueChanged: (value){
                          selectType=value;
                        },

                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: newEmailController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration:const InputDecoration(
                      hintText: 'enter email',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      fillColor: Colors.white,
                      label: Text(
                        'Email',
                        style:TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty||!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value!)){
                        return 'please provide your email ';
                      }else{
                        email=value;
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: newMobileNoController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration:const InputDecoration(
                      hintText: 'mobile no',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      fillColor: Colors.white,
                      label: Text(
                        'Mobile No',
                        style:TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty||!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(value!)){
                        return 'please provide your mobile no';
                      }else{
                        mobileNo=value;
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: newAddressController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration:const InputDecoration(
                      hintText: 'address',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      fillColor: Colors.white,
                      label: Text('Address',style:TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'please provide address';
                      }else{
                        address=value;
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    readOnly: true,
                    textInputAction: TextInputAction.none,
                    controller: newLocationController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration:InputDecoration(
                      hintText: 'enter location',
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      fillColor: Colors.white,
                      label: const Text(
                        'Location',
                        style:TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      suffixIcon: IconButton(
                          onPressed:()async{
                            //Get.to(MyHomePage());
                            _awaitReturnValueFromSecondScreen(context);
                          },
                          icon:const Icon(Icons.location_on_outlined,color: Colors.white, size: 30,),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'please provide location';
                      }else{
                       location=value;
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: newPasswordController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    obscureText: passwordOb,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: ' enter password',
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      fillColor: Colors.white,
                      label: const Text(
                        'Password',
                        style:TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      ),
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            passwordOb = !passwordOb;
                          });
                        },
                        icon: Icon(passwordOb ?
                        Icons.visibility_off: Icons.visibility),
                        color: Colors.white,
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'please provide password';
                      }else{
                       password=value;
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: newConfrimPasswordController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    obscureText: confirmPasswordOb,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'enter confirm password',
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      fillColor: Colors.white,
                      label: const Text(
                        'Confirm Password',style:TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      ),
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          confirmPasswordOb=!confirmPasswordOb;
                        });

                      },
                      icon: Icon( confirmPasswordOb ?
                      Icons.visibility_off: Icons.visibility,
                      ),
                      color: Colors.white,

                    ),
                    ),

                    validator: (value){
                      if(value!.isEmpty){
                        return 'please provide confirm password';
                      }else{
                        confrimPassword=value;
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: ElevatedButton(
                      onPressed:() async{
                        var formValid = true;
                       var name=fullNnameController.text;
                       var businessType=workerType.text;
                       var email=newEmailController.text;
                       var mobileNo=newMobileNoController.text;
                       var address=newAddressController.text;
                       var location=newLocationController.text;
                       var password=newPasswordController.text;
                       //var confirmPassword=newConfrimPasswordController.text;

                        setState(() {


                        });

                        if(myKey.currentState!.validate()){
                          ProgressDialog progressDialog = ProgressDialog(context,
                              message: const Text("Signing Up"),
                              title: const Text("Please wait..."),
                          );
                          progressDialog.show();
                        FirebaseAuth firebaseAuth=FirebaseAuth.instance;
                        FirebaseFirestore fireStore=FirebaseFirestore.instance;
                        CollectionReference users=fireStore.collection('users');

                        try {
                           UserCredential userCredential=await firebaseAuth.createUserWithEmailAndPassword(
                              email:email, password: password
                           );
                           var id=FirebaseAuth.instance.currentUser!.uid;

                           users.doc(id).set({
                             'name':name,
                             'businessType':businessType,
                             'email':email,
                             'mobileNo':mobileNo,
                             'address':address,
                             'location':location,
                             'password':password,
                             'uid':firebaseAuth.currentUser!.uid,
                           });
                           Fluttertoast.showToast(msg: 'Sign Up Successful');
                             progressDialog.dismiss();
                             Get.to(const LoginScreen());

                        } on FirebaseAuthException catch(e){
                          progressDialog.dismiss();
                          if (e.code == 'weak-password') {
                            Fluttertoast.showToast(msg: 'Weak Password');
                          } else if (e.code == 'email-already-in-use') {
                            Fluttertoast.showToast(msg: 'Email Already in Use');
                          }
                        } catch (e) {
                          Fluttertoast.showToast(msg: 'Something went wrong');
                          progressDialog.dismiss();
                        }
                        }

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
                        'Submit',
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
        ),

      ),
    );
  }
  void _awaitReturnValueFromSecondScreen(BuildContext context) async {

    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      var texttxt = result;
      newLocationController.text=texttxt;
      //Fluttertoast.showToast(msg: texttxt);
    });
  }
  List<String> businessType=
  [
    'Mechanic',
    'plumber',
    'Electron',
    'Auto Mechanic',
    'car Mechanic',
    'painter',
    'Elctration''car Painter',
    'Auto body mechanics',
    'Race car mechanics',
    'Service technicians',
  ];
}


