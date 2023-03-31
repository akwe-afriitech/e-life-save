import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class donorbr extends StatelessWidget {
  const donorbr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> userData = FirebaseFirestore.instance
        .collection('request')
        .snapshots();
    final Stream<QuerySnapshot> request = FirebaseFirestore.instance.collection('request').snapshots();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Request'),
        centerTitle: true
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   child: StreamBuilder<QuerySnapshot>(
            //     stream: request,
            //     builder: (
            //         BuildContext context,
            //         AsyncSnapshot<QuerySnapshot> snapshot,
            //     ){
            //       if(snapshot.hasError){
            //         return Text("something went wrong");
            //       }
            //       if(snapshot.connectionState== ConnectionState.waiting){
            //         return Text('loading....');
            //       }
            //       final data = snapshot.requireData;
            //       return ListView.builder(
            //         itemCount: data.size,
            //           itemBuilder: (context, index) {
            //             return ListTile(
            //               leading: CircleAvatar(child: Text("R"),),
            //               title: Text(data.docs[index]['bob']),
            //             );
            //           },
            //       );
            //
            //     }
            //   ),
            // ),
            Container(
              alignment: Alignment.center,
              width: 395,
              margin: const EdgeInsets.all(10),
              height: 650,
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
                        tileColor: Colors.grey[100],
                        leading: const Icon(Icons.bloodtype_outlined,
                        color: Colors.red,),
                        title: Text("Location: ${data1.docs[index]['location']} "),
                        subtitle: Text("Blood Request type: ${data1.docs[index]['bg']} "),
                        onTap: () {},
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
          ],
        ),
      ),
    );
  }
}
