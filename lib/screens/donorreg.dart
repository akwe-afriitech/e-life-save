import 'package:e_life_saver/screens/donorreg2.dart';
import 'package:e_life_saver/screens/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/mainpage.dart';

class donorreg extends StatefulWidget {
   donorreg({Key? key}) : super(key: key);

  @override
  State<donorreg> createState() => _donorregState();
}

class _donorregState extends State<donorreg> {
  final formkey = GlobalKey<FormState>();


  final emailController = TextEditingController();

   final passwordController = TextEditingController();
   var _nameController = '';

   @override
   void dispose(){
     emailController.dispose();
     passwordController.dispose();

     super.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(0),
                      margin: const EdgeInsets.all(0),
                      child: const Image(image:AssetImage('assets/logo.png'),),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      child: const Text('Register To Be A Donor', style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline
                      ),),
                    ),
                    TextFormField(
                      onChanged: (value){
                        _nameController = value;
                      },
                      validator: (value){
                        if(value != null){'Please Enter Your Name';}
                        else
                        { null;}
                      },
                        decoration: const InputDecoration(
                        labelText: 'Full Name'
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          labelText: 'Email'
                      ),
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email)=>
                      email !=null && !EmailValidator.validate(email)
                          ?"Enter a valid email": null,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'password'
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value)=>value != null && value.length<6
                          ? 'enter a minimum of 6 characters'
                          : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(300, 40),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: signup,
                          child: const Text('Next')
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(300, 40),
                            shape: const StadiumBorder(),
                          ),
                          onPressed:
                              (){Navigator.pushReplacement(context,
                              MaterialPageRoute(builder:
                                  (context) =>
                                    login()
                              ),);},
                          child: const Text('Login')
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }

   Future signup() async{
     final isValid = formkey.currentState!.validate();
     if(!isValid)return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context)=> const Center(child: CircularProgressIndicator(),)
    );
     try{
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: emailController.text.trim(),
           password: passwordController.text.trim(),
       );
       await FirebaseAuth.instance.currentUser?.updateDisplayName(_nameController);

     }on FirebaseException catch (e) {
       print(e);

     }
    Navigator.push(context,
      MaterialPageRoute(builder:
          (context) =>
          donorreg2()
      ),);


   }
}
