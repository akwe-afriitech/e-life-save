
import 'package:e_life_saver/screens/init.dart';
import 'package:e_life_saver/screens/splash.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/material.dart';

import '../auth/utils.dart';

  class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
          child: Center(
            child: Container(
              height: 580,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const Image(image:AssetImage('assets/logo.png'),),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(),
                        child: const Text('Login', style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            // decoration: TextDecoration  `.underline
                        ),),
                      ),

                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Email'
                        ),
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email)=>
                        email !=null && !EmailValidator.validate(email)
                            ?"Enter a valid email": null,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Password'
                        ),
                        controller: passwordController,
                        textInputAction: TextInputAction.done,
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
                            onPressed: signIn,
                            child: const Text('Login')
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(300, 40),
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(context,
                              MaterialPageRoute(builder:
                                  (context) =>
                                  const init()
                              ),);},
                            child: const Text('Register')
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    final isValid = formkey.currentState!.validate();
    if(!isValid)return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator(),)
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }on FirebaseException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder:
          (context) =>
          const splash()
      ),);

  }
}