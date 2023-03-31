import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class bloodAppeals extends StatelessWidget {
   bloodAppeals({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> userData = FirebaseFirestore.instance
        .collection('userData')
        .doc(user?.uid)
        .collection('request')
        .snapshots();
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                // border: Border.all(width: 3, color: Colors.red)
              ),
              child: Text('All Appeals Sent',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),
              ),
            ),
            Container(
              width: 390,
              height: 500,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Container(
                width: 375,
                margin: const EdgeInsets.all(10),
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
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
                        Timestamp t =data1.docs[index]['date'] as Timestamp;
                        DateTime date = t.toDate();
                        return ListTile(
                          leading: const Icon(Icons.bloodtype_outlined, color:Colors.red),
                          title: Text("Location: ${data1.docs[index]['location']} "),
                          subtitle: Text("Blood Request type: ${data1.docs[index]['bg']} "),
                          onTap: () {},
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("date"),
                              Text("${date.day}/${date.month}", style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17
                              ),),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
