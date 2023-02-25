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
                      return Text("error loading data");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("loading.....");
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
                    MaterialPageRoute(builder: (context) => accountr()));
              },
            ),
            Container(
              width: 20,
              margin: EdgeInsets.symmetric(horizontal: 50),
              padding: EdgeInsets.symmetric(vertical: 50),
              child: ElevatedButton(
                child: Text('signout'),
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => Center(
                            child: CircularProgressIndicator(),
                          ));
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => init(),
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
                  height: 160.0,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.red, width: 1.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 7,
                            spreadRadius: 1,
                            offset: const Offset(2, 2))
                      ],
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
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
                                    color: Colors.black54
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              child:  Text(
                                "${user?.displayName}",
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87
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
                                    color: Colors.black54
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
                                    return Text("error loading data");
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text("loading.....");
                                  }
                                  final data1 = snapshot.requireData;
                                  return Text(
                                    "${data1.docs[0]['location']} ",
                                    style: TextStyle(
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
                                    color: Colors.black54
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
                                    return Text("error loading data");
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text("loading.....");
                                  }
                                  final data1 = snapshot.requireData;
                                  return Text(
                                    "${data1.docs[0]['bg']} ",
                                    style: TextStyle(
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
                  )),
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
                    return Text("error loading data");
                  }
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Text("loading.....");
                  }
                  final data1 = snapshot.requireData;
                  return ListView.builder(
                    itemCount: data1.size,
                      itemBuilder: (context, index){
                      return ListTile(
                        leading: const Icon(Icons.bloodtype_outlined),
                        title: Text("Location: ${data1.docs[index]['location']} "),
                        subtitle: Text("Blood Request type: ${data1.docs[index]['bg']} "),
                        onTap: () {},
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
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
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: ElevatedButton(
                child: Text("new appeal"),
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
