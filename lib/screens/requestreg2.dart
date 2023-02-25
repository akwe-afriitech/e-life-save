import 'dart:async';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_life_saver/screens/login.dart';
import 'package:e_life_saver/screens/receipdash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

class requestreg2 extends StatefulWidget {
  requestreg2({Key? key}) : super(key: key);

  @override
  State<requestreg2> createState() => _requestreg2State();
}

class _requestreg2State extends State<requestreg2> {
  final _bg = ["Select your BG","A","B","AB","O","Don't Know"];
  final _factor = ["Select your factor","+ve","-ve","Don't Know"];
  final user = FirebaseAuth.instance.currentUser;

  var _phonenumber='';
  var _dob='';
  var _bob='';
  var _location='';
  var _rhr='';
  var _bgr='';
  var _date= TextEditingController();
  var _medicalinfo='';
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
                key:formkey,
                child: Column(
                  children: [
                    Container(
                      child: Image(image:AssetImage('assets/logo.png'),),
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
                          labelText: 'Number'
                      ),
                      onChanged: (value){
                        _phonenumber = value;
                      },
                      validator: (value) {
                        if(value== null || value.isEmpty || value.length<9){
                          return 'please enter Your Phone Number';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if(value== null || value.isEmpty){
                          return 'please enter Your Date of Birth';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Date Of Birth'
                      ),
                    ),

                    TextFormField(
                      onChanged: (value){
                        _bob = value;
                      },
                      validator: (value) {
                        if(value== null || value.isEmpty){
                          return 'please enter bags of blood required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Bags of Blood Needed'
                      ),
                    ),
                    TextFormField(
                      onChanged: (value){
                        _location = value;
                      },
                      validator: (value) {
                        if(value== null || value.isEmpty){
                          return 'please enter Your Current location or Hospital';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Location or Hospital'
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
                                  _bgr = val!;
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
                    TextFormField(
                      onChanged: (value){
                        _medicalinfo = value;
                      },
                      validator: (value) {
                        if(value== null || value.isEmpty){
                          return 'please enter Your emmergency';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Medical Info'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(300, 40),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: (){
                            final isValid = formkey.currentState!.validate();
                            if(!isValid)return;
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                contentPadding: const EdgeInsets.all(10),
                                content: Container(
                                  height: 250,
                                  margin: EdgeInsets.all(0),
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "Pay Service Charge",
                                              style:
                                              TextStyle(fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text("In order to make a blood requst, "),
                                      Text("you have to pay a platform of , "),
                                      Container(
                                        width: 150,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black54, width: 3),
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Text('500', style:
                                        TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25
                                        ),),
                                      ),
                                      Text('Click to pay'),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    fixedSize: const Size(100, 40),
                                                    shape: const StadiumBorder(),
                                                  ),
                                                  child: const Text("Cancel"),
                                                  onPressed: () => Navigator.pop(context),
                                                ),
                                              ),
                                              Container(
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    fixedSize: const Size(100, 40),
                                                    shape: const StadiumBorder(),
                                                  ),
                                                  onPressed: () {
                                                    UssdAdvanced.sendUssd(code: "*126*9*650204677*500#", subscriptionId: 1);
                                                    Timer(Duration(seconds: 5),
                                                            () =>
                                                            Navigator.push(context,
                                                                MaterialPageRoute(builder:
                                                                    (context) => receipdash()
                                                                )
                                                            )
                                                    );
                                                    if (user != null){
                                                      DateTime _now = DateTime.now();
                                                      final uid = user?.uid;
                                                      CollectionReference userData = FirebaseFirestore.instance.collection('userData').doc(uid).collection('request');
                                                      DocumentReference users = FirebaseFirestore.instance.collection('userData').doc(uid);
                                                      CollectionReference request = FirebaseFirestore.instance.collection('request');
                                                      userData.add({
                                                        "date" : _now,
                                                        'phonenumber':_phonenumber,
                                                        'dob':_dob,
                                                        'bob':_bob,
                                                        'medicalinfo': _medicalinfo,
                                                        'bg': _bgr,
                                                        'location': _location,
                                                        'rh': _rhr,
                                                      });
                                                      request.add({
                                                         "date" : _now,
                                                        'phonenumber':_phonenumber,
                                                        'dob':_dob,
                                                        'bob':_bob,
                                                        'medicalinfo': _medicalinfo,
                                                        'bg': _bgr,
                                                        'location': _location,
                                                        'rh': _rhr,
                                                      });
                                                      users.set({
                                                        "role":"request",
                                                      });

                                                    }

                                                  },
                                                  child: const Text("Pay"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );

                            // Navigator.push(context,
                            //   MaterialPageRoute(builder:
                            //       (context) =>
                            //       const receipdash()
                            //   ),);
                          },
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
    );

  }
}
