import 'package:e_life_saver/screens/donorreg.dart';
import 'package:e_life_saver/screens/login.dart';
import 'package:e_life_saver/screens/requestreg.dart';
import 'package:flutter/material.dart';

class init extends StatelessWidget {
  const init({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 380,
            child: Column(
              children: [
                Container(
                  child: const Image(image:AssetImage('assets/logo.png'),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(250, 50),
                      shape: const StadiumBorder(),
                    ),
                      onPressed: (){
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context)=> const Center(child: CircularProgressIndicator(),)
                        );
                        Navigator.push(context,
                            MaterialPageRoute(builder:
                        (context) =>
                            requestreg()
                        ),);
                      },
                      child: const Text('Request For Blood',
                      style:TextStyle(
                        fontSize: 17
                      ) ,
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(260,50),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: (){
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context)=> const Center(child: CircularProgressIndicator(),)
                        );
                        Navigator.push(context,
                          MaterialPageRoute(builder:
                              (context) =>
                              donorreg(),
                          ),);
                      },
                      child: const Text('Donate Blood',
                      style: TextStyle(
                        fontSize: 17
                      ),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an Account:'),
                      TextButton(
                          onPressed: (){
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context)=> const Center(child: CircularProgressIndicator(),)
                            );
                            Navigator.pushReplacement(context,
                              MaterialPageRoute(builder:
                                  (context) =>
                                  login(),
                              ),);
                          },
                          child: const Text('Login',
                            style: TextStyle(
                                fontSize: 17
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
