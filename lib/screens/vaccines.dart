import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class vaccines extends StatelessWidget {
  const vaccines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user =  FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20),
              child: Text('Hello ${user.displayName}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.black)
                          ),
                          child: Text(
                            "First dose",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black)
                          ),
                          child: Text(
                              "Second Dose",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black)
                          ),
                          child: Text(
                              "Third Does",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500
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
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black)
                          ),
                          child: Text(
                            "pending...",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black)
                          ),
                          child: Text(
                            "pending",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black)
                          ),
                          child: Text(
                            "pending....",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(120, 30),
                          shape: StadiumBorder(),
                        ),
                        onPressed: (){},
                        child: Text('Download',
                          style:TextStyle(
                              fontSize: 18
                          ) ,
                        )
                    ),
                  ),

                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20),
              child: Text('Yellow Fever',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              width: 390,
              height: 50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)
              ),
              child: Text("Not Taken "),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20),
              child: Text('Covid 19',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              width: 390,
              height: 50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2)
              ),
              child: Text("Not Taken "),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20),
              child: Text("STD's",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              width: 390,
              height: 50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2)
              ),
              child: Text("Not Taken "),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20),
              child: Text('HIV',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              width: 390,
              height: 50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2)
              ),
              child: Text("Not Taken "),
            ),



          ],
        ),
      ),
    );
  }
}
