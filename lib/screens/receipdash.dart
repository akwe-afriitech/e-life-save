import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_life_saver/screens/accountreciept.dart';
import 'package:e_life_saver/screens/requestreg2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'bloodappeal.dart';
import 'init.dart';

class receipdash extends StatefulWidget {
  const receipdash({Key? key}) : super(key: key);

  @override
  State<receipdash> createState() => _receipdashState();
}

final user = FirebaseAuth.instance.currentUser;

final Stream<QuerySnapshot> users =
    FirebaseFirestore.instance.collection('users').snapshots();

class _receipdashState extends State<receipdash> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> userData = FirebaseFirestore.instance
        .collection('userData')
        .doc(user?.uid)
        .collection('request')
        .snapshots();
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              accountName: Container(
                child: Text("${user?.displayName}"),
              ),
              accountEmail: Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: userData,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text("error loading data");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("loading.....");
                    }
                    final data1 = snapshot.requireData;
                    return Text(
                      "${data1.docs[1]['phonenumber']} ",
                      // style: TextStyle(
                      //   fontSize:30, fontWeight: FontWeight.bold,
                      // ),
                    );
                  },
                ),
                // child: const Text(
                //   "Earl Millen Toh",
                //   style: TextStyle(
                //       fontSize: 27,
                //       fontWeight: FontWeight.w700,
                //       color: Colors.black87
                //   ),
                // ),
              ),
              otherAccountsPictures: const [
                CircleAvatar(
                  child: Icon(Icons.person_add),
                ),
              ],
            ),
            ListTile(
              tileColor: Colors.grey[200],
              leading: const Icon(Icons.home),
              title: const Text("Dashboard"),
            ),
            // ListTile(
            //   leading: const Icon(Icons.monetization_on_outlined),
            //   title: const Text("Balance"),
            //   onTap: () {},
            // ),
            ListTile(
              leading: const Icon(Icons.bloodtype_outlined),
              title: const Text("Blood Appeals"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => bloodAppeals()));
              },
            ),
            ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text("Notifications"),
                onTap: () {}),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text("Upgrade Account"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const accountr()));
              },
            ),
            Container(
              width: 20,
              margin: const EdgeInsets.symmetric(horizontal: 50),
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: ElevatedButton(
                child: const Text('signout'),
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ));
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const init(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Container(
                  width: 400.0,
                  height: 150.0,
                  padding: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      border: Border.all(color: Colors.red, width: 1.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 7,
                            spreadRadius: 1,
                            offset: const Offset(2, 2))
                      ],
                      borderRadius: BorderRadius.circular(40.0)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: -40,
                          left: -40,
                          child:Container(
                            width: 120,
                            height: 127,
                            decoration: BoxDecoration(
                              color: Colors.white,
                                borderRadius: BorderRadius.circular(100.0),
                  ),
                          )
                      ),
                      Positioned(
                          bottom: -80,
                          right: -50,
                          child:Container(
                            width: 180,
                            height: 184,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          )
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Text(
                                    "Name:",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  child:  Text(
                                    "${user?.displayName}",
                                    style: const TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Text(
                                    "Location: ",
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.bold,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  child: StreamBuilder<QuerySnapshot>(
                                    stream: userData,
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.hasError) {
                                        return const Text("error loading data");
                                      }
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Text("loading.....");
                                      }
                                      final data1 = snapshot.requireData;
                                      return Text(
                                        "${data1.docs[0]['location']} ",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize:20, fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text(
                                    "BG :",
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.bold,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  child: StreamBuilder<QuerySnapshot>(
                                    stream: userData,
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.hasError) {
                                        return const Text("error loading data");
                                      }
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Text("loading.....");
                                      }
                                      final data1 = snapshot.requireData;
                                      return Text(
                                        "${data1.docs[0]['bg']} ",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize:20, fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Appeals',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: 375,
              margin: const EdgeInsets.all(10),
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.circular(40.0)),
              child: StreamBuilder<QuerySnapshot>(
                stream: userData,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text("error loading data");
                  }
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Text("loading.....");
                  }
                  final data1 = snapshot.requireData;
                  return ListView.builder(
                    itemCount: data1.size,
                      itemBuilder: (context, index){
                      Timestamp t =data1.docs[index]['date'] as Timestamp;
                      DateTime date = t.toDate();
                      return ListTile(
                        leading: const Icon(Icons.bloodtype_outlined,
                        color: Colors.red),
                        title: Text("Location: ${data1.docs[index]['location']} "),
                        subtitle: Text("Blood Request Type: ${data1.docs[index]['bg']} "),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text("${date.hour}:${date.minute}"),
                            Text("${date.day}/${date.month}", style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17
                            ),),
                          ],
                        ),
                        onTap: () {},
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      );
                      },
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ElevatedButton(
                child: const Text("new appeal"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => requestreg2()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
