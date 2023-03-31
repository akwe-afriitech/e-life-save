import 'package:e_life_saver/screens/donordash.dart';
import 'package:intl/intl.dart';
import 'package:e_life_saver/screens/donorn.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class donorreg2 extends StatefulWidget {
  donorreg2({Key? key}) : super(key: key);

  @override
  State<donorreg2> createState() => _donorreg2State();
}

class _donorreg2State extends State<donorreg2> {
  final user = FirebaseAuth.instance.currentUser;
  var _phonenumber='';
  var _dob='';
  var _bgr='';
  var _rhr='';
  var _city='';
  var _address='';
  var _date= TextEditingController();


  final _bg = ["Select your BG","A","B","AB","O","Don't Know"];

  final _factor = ["Select your factor","+ve","-ve","Don't Know"];
  final formkey = GlobalKey<FormState>();


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
                      child: Text('fill To Be A Donor', style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline
                      ),),
                    ),

                    TextFormField(
                      controller: _date,
                      onTap: ()async{
                        DateTime? pickdate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1990),
                            lastDate: DateTime(2025)
                        );
                        if(pickdate != null){
                          setState(() {
                            _date.text = DateFormat("yyyy-MM-DD").format(pickdate);
                          });
                        }

                      },
                      onChanged: (value){
                        _dob = value;
                      },
                      decoration: InputDecoration(
                          labelText: 'Date Of Birth'
                      ),
                    ),
                    TextFormField(
                      onChanged: (value){
                        _phonenumber = value;
                      },
                      validator: (value)=>value != null && value.length<9
                          ? 'Please Enter Your Correct Phone Number'
                          : null,
                      decoration: InputDecoration(
                          labelText: 'Phone Number'
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // DropdownButtonFormField(
                          //     value: _bg[0],
                          //     items: _bg.map((e) => DropdownMenuItem(child: Text(e), value: e,)
                          //     ).toList(), onChanged: (val){
                          // }),
                          Container(
                            width: 150,

                            child: DropdownButtonFormField(
                                value: _bg[0],
                                items: _bg.map((e) => DropdownMenuItem(child: Text(e), value: e,)
                                ).toList(), onChanged: (val){
                                  _bgr= val!;
                                },
                              ),

                          ),
                          Container(
                            width: 150,

                            child: DropdownButtonFormField(
                                value: _factor[0],
                                items: _factor.map((e) => DropdownMenuItem(child: Text(e), value: e,)
                                ).toList(), onChanged: (val){
                                  _rhr = val!;
                            },
                            ),
                          ),
                        ],
                      ),
                    ),
                    // TextFormField(
                    //
                    //   decoration: InputDecoration(
                    //       labelText: 'Country'
                    //   ),
                    //   autovalidateMode: AutovalidateMode.onUserInteraction,
                    //   validator: (value)=>value != null
                    //       ? 'please enter your country name'
                    //       : null,
                    //
                    // ),
                    TextFormField(
                      onChanged: (value){
                        _city = value;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value)=>value != null && value.length<3
                          ? 'Please Enter Your Correct Phone Number'
                          : null,
                      decoration: InputDecoration(
                          labelText: 'City'
                      ),
                    ),
                    TextFormField(
                      onChanged: (value){
                        _address = value;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value)=>value != null && value.length<3
                          ? 'Please Enter your City'
                          : null,

                      decoration: InputDecoration(
                          labelText: 'Address'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(300, 40),
                            shape: StadiumBorder(),
                          ),
                          onPressed: (){
                            final isValid = formkey.currentState!.validate();
                            if(!isValid)return;
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => Center(child: CircularProgressIndicator(),)
                            );


                            if (user != null){
                              DateTime _now = DateTime.now();
                              final uid = user?.uid;
                              DocumentReference users = FirebaseFirestore.instance.collection('userData').doc(uid);

                              CollectionReference userData = FirebaseFirestore.instance.collection('userData').doc(uid).collection('request');
                              userData.add({
                                "role":"donor",
                                "date" : _now,
                                'phonenumber':_phonenumber,
                                'dob':_dob,
                                'bg': _bgr,
                                'rhr': _rhr,
                                'city': _city,
                                'address': _address,

                              });
                              users.set({
                                "role":"donor",
                              });
                            }
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder:
                                    (context) => donordash()
                                )
                            );

                          },
                          child: Text('finish')
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


}
