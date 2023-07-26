import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worker/models/user_model.dart';
import 'package:worker/models/worker_model.dart';
import 'package:worker/screens/worker_screen/worker_home.dart';
import 'my_loction.dart';
class UpdateScreen extends StatefulWidget {
  final UserModel userModel;
  const UpdateScreen({Key? key, required this.userModel}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
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

  var myKey=GlobalKey<FormState>();
  var name,email,mobileNo,address,location,password,confrimPassword, business;

  @override
  void initState(){
    //app run hony ky sat sat data utany k liye hum ny inite state lagaya hy
    fullNnameController.text=widget.userModel.name;
    newBusinessController.text=widget.userModel.businessType;
    newEmailController.text=widget.userModel.email;
    newMobileNoController.text=widget.userModel.mobileNo;
    newAddressController.text=widget.userModel.address;
    newLocationController.text=widget.userModel.location;
    newPasswordController.text=widget.userModel.password;
    newConfrimPasswordController.text=widget.userModel.confrimPassword;

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text(
          'Update Screeen',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: myKey,
            child: Column(
              children: [
                const SizedBox(height: 50,),
                const Text(
                  'Update Profile',
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
                    if(value!.isEmpty||!RegExp(r'^[a-zA-Z\s]*$').hasMatch(value)){
                      return 'please provide your name';
                    }else{
                      name=value;
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: newBusinessController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  decoration:const InputDecoration(
                    hintText: 'enter business name',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    fillColor: Colors.white,
                    label: Text(
                      'Business',
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
                    if(value!.isEmpty||!RegExp(r'^[a-zA-Z\s]*$').hasMatch(value)){
                      return 'please provide your business name';
                    }else{
                      business=value;
                      return null;
                    }
                  },
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
                    if(value!.isEmpty||!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value)){
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
                      if(myKey.currentState!.validate()){
                        updateData(
                            name: fullNnameController.text,
                            business: newBusinessController.text,
                            email: newEmailController.text,
                            mobileNo: newMobileNoController.text,
                            address: newAddressController.text,
                            location: newLocationController.text,
                            password: newPasswordController.text
                        );
                      }
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
                      'Update',
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
      Fluttertoast.showToast(msg: texttxt);
    });
  }
  void updateData({
    required String name,
    required String business,
    required String email,
    required  String mobileNo,
    required String address,
    required String location,
    required String password,
})async {
    User? users = FirebaseAuth.instance.currentUser;
    if (users != null) {
      var uRef = FirebaseFirestore.instance.collection('users').doc(users.uid);
      await uRef.update(
          {
            'name': name,
            'business': business,
            'email': email,
            'mobileNo': mobileNo,
            'address': address,
            'location': location,
            'password': password,
          });
      Fluttertoast.showToast(
        msg: 'profile Update Successful',
        textColor: Colors.teal,
        backgroundColor: Colors.white,

      );
      //print('name of user is ${users.name}');
      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        return const HomeWorker();
      }));
    }
  }
}
