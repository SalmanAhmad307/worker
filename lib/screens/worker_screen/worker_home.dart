import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker/models/user_model.dart';
import 'package:worker/models/worker_model.dart';
import 'package:worker/screens/worker_screen/update_screen.dart';

import '../home_screen.dart';
import 'login-screen.dart';
class HomeWorker extends StatefulWidget {
  const HomeWorker({Key? key}) : super(key: key);

  @override
  State<HomeWorker> createState() => _HomeWorkerState();
}

class _HomeWorkerState extends State<HomeWorker> {
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var user=<UserModel>[];
    return Scaffold(
      backgroundColor: Colors.teal,
        appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
            'Home',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
                Get.to(const LoginScreen());
              }, icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          ),

          IconButton(
            onPressed: (){
              Get.to(const HomeScreen());

            }, icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          ),
    ],
            centerTitle: true,
          backgroundColor: Colors.teal,
       ),


           body: StreamBuilder(
             stream: FirebaseFirestore.instance.collection('users')
             .where('uid', isEqualTo: firebaseAuth.currentUser!.uid)
                 .snapshots(),
            builder:(context, AsyncSnapshot<QuerySnapshot>  snapshot){
             if(snapshot.hasData && !snapshot.hasError){
               return ListView.builder(
                 shrinkWrap: true,
                 itemCount: snapshot.data!.docs.length,
                   itemBuilder:(context,index){
                   //UserModel UserObject=user[index];
                   var newData=snapshot.data!.docs[index];
                   return SingleChildScrollView(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           const SizedBox(height: 30,),
                           const Center(
                             child: Text(
                                 'Profile',
                               style: TextStyle(
                                 fontSize: 30,
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ),
                           const SizedBox(height: 50,),
                           Card(
                             color: Colors.white,
                             child: Container(
                               height: 45,
                               width: 250,

                               child: Center(
                                 child: Text(
                                     'Name: ${newData['name']}',
                                   style: const TextStyle(
                                     fontSize: 15,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.teal,

                                   ),
                                 ),
                               ),
                             ),
                           ),
                           const SizedBox(height: 10,),
                           Card(
                             color: Colors.white,
                             child: Container(
                               height: 45,
                               width: 250,

                               child: Center(
                                 child: Text(
                                   'Business Type : ${newData['businessType']}',
                                   style: const TextStyle(
                                     fontSize: 15,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.teal,

                                   ),
                                 ),
                               ),
                             ),
                           ),
                           const SizedBox(height: 10,),
                           Card(
                             color: Colors.white,
                             child: Container(
                               height: 45,
                               width: 250,
                               child: Center(
                                 child: Text(
                                   'Email: ${newData['email']}',
                                   style: const TextStyle(
                                     fontSize: 15,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.teal,

                                   ),
                                 ),
                               ),
                             ),
                           ),
                           const SizedBox(height: 10,),
                           Card(
                             color: Colors.white,
                             child: Container(
                               height: 45,
                               width: 250,
                               child: Center(
                                 child: Text(
                                   'Mobile No: ${newData['mobileNo']}',
                                   style: const TextStyle(
                                     fontSize: 15,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.teal,

                                   ),
                                 ),
                               ),
                             ),
                           ),
                           const SizedBox(height: 10,),
                           Card(
                             child: Container(
                               height: 45,
                               width: 250,
                               child: Center(
                                 child: Text(
                                   'Address: ${newData['address']}',
                                   style: const TextStyle(
                                     fontSize: 15,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.teal,

                                   ),
                                 ),
                               ),
                             ),
                           ),
                           const SizedBox(height: 30,),
                           Padding(
                             padding: const EdgeInsets.all(18.0),
                             child: Container(
                               width: 250,
                               height: 45,
                               margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(90),
                               ),
                               child: ElevatedButton(
                                 onPressed:()async{
                                   Get.to(
                                       UpdateScreen(userModel:UserModel(
                                     uid: firebaseAuth.currentUser!.uid,
                                     name: newData['name'],
                                     businessType: newData['businessType'],
                                     email: newData['email'],
                                     mobileNo: newData['mobileNo'],
                                     address: newData['address'],
                                     location: newData['location'],
                                     password: newData['password'],
                                     confrimPassword: 'confrimPassword',

                                   )
                                   )
                                   );



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
                                   'Update Profile',
                                   style: TextStyle(
                                     fontSize: 15,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.teal,
                                   ),
                                 ),

                               ),
                             ),
                           ),



                         ],
                     ),
                      ),
                   );


                   }
               );
             } else{
               return const Center(
                 child: CircularProgressIndicator(),
               );
             }

          },
      ),
    );



  }
}
