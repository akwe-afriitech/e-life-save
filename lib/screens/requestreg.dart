
import 'package:e_life_saver/screens/login.dart';
import 'package:e_life_saver/screens/requestreg2.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/utils.dart';

class requestreg extends StatefulWidget {
  requestreg({Key? key}) : super(key: key);

  @override
  State<requestreg> createState() => _requestregState();
}

class _requestregState extends State<requestreg> {

  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Padding (
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Container(
                      child: Image(image: AssetImage('assets/logo.png'),),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(0),
                      child: const Text('Fill The Form To Request For Blood',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                        ),),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Full Name'
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          labelText: 'Email'
                      ),
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
                      padding: const EdgeInsets.all(20),
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
                          onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context) =>
                                  login()
                              ),);
                          },
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

  Future signup() async {
    final isValid = formkey.currentState!.validate();
    if(!isValid)return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),);
    } on FirebaseException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder:
          (context) =>
          requestreg2()
      ),);
  }
}