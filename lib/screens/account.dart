import 'package:e_life_saver/screens/donordash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class account extends StatelessWidget {
  const account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user =  FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width:130,
                    height: 130,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.red.shade400, width: 6.0),
                      borderRadius: BorderRadius.circular(20)
                    ),

                    child: const Icon(Icons.person, size: 120,),
                  ),
                  Container(
                    width: 130,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text('${user.displayName}',style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25.0,
                        ),),
                        Text('bts',style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 25.0,
                        ),),
                        const Text('23423', style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 30
                        ),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width:150,
                        child: const Text('Name :',style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                        ),),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: 250,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width:150,
                        child: const Text('Phone :',style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: 250,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width:150,
                        child: const Text('Email :',style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: 250,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width:150,
                        child: const Text('City :',style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: 250,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width:150,
                        child: const Text('Address :',style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: 250,
                        height: 40,
                        child: TextFormField(
                          decoration:  InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width:150,
                        child: const Text('Old Password :',style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: 250,
                        height: 40,
                        child: TextFormField(
                          decoration:  InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width:150,
                        child: const Text('New Password :',style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: 250,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 45),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) =>
                          const donordash()
                      ),);
                  },
                  child: const Text('Update',
                    style:TextStyle(
                        fontSize: 20
                    ) ,
                  )
              ),
            )

          ],
        ),
      ),
    );
  }
}
