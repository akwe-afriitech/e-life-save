import 'package:e_life_saver/screens/donorreg2.dart';
import 'package:e_life_saver/screens/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class donorreg extends StatefulWidget {
   donorreg({Key? key}) : super(key: key);

  @override
  State<donorreg> createState() => _donorregState();
}

class _donorregState extends State<donorreg> {
  final formkey = GlobalKey<FormState>();


  final emailController = TextEditingController();

   final passwordController = TextEditingController();

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
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(0),
                      child: Image(image:AssetImage('assets/logo.png'),),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Text('Register To Be A Donor', style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline
                      ),),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Full Name'
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
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
                      decoration: InputDecoration(
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
                            fixedSize: Size(300, 40),
                            shape: StadiumBorder(),
                          ),
                          onPressed: signup,
                          child: Text('Next')
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(300, 40),
                            shape: StadiumBorder(),
                          ),
                          onPressed:
                              (){Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context) =>
                                    login()
                              ),);},
                          child: Text('Login')
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
        builder: (context)=> Center(child: CircularProgressIndicator(),)
    );

     try{
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: emailController.text.trim(),
           password: passwordController.text.trim(),);

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
