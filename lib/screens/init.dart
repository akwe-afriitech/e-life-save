import 'package:e_life_saver/screens/donorreg.dart';
import 'package:e_life_saver/screens/login.dart';
import 'package:e_life_saver/screens/requestreg.dart';
import 'package:e_life_saver/screens/scanner.dart';
import 'package:flutter/material.dart';

class init extends StatelessWidget {
  const init({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(80, 50),
                      ),
                      child: const Icon(Icons.qr_code_scanner, size: 30,),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const qrcode(),),);
                      },
                    ),
                    const Text('Scan QR Code', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
              ),
              Container(
                height: 450,
                margin: const EdgeInsets.symmetric(horizontal: 35.0),
                padding: const EdgeInsets.only(top: 30.0),
                decoration: BoxDecoration(
                  border:Border.all( width: 8.0, color: Colors.red, ),
                  borderRadius: BorderRadius.circular(10),
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
