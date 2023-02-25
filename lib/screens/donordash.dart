import 'package:e_life_saver/screens/account.dart';
import 'package:e_life_saver/screens/donora.dart';
import 'package:e_life_saver/screens/donorbr.dart';
import 'package:e_life_saver/screens/donorn.dart';
import 'package:e_life_saver/screens/donorr.dart';
import 'package:e_life_saver/screens/init.dart';
import 'package:e_life_saver/screens/login.dart';
import 'package:e_life_saver/screens/vaccines.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class donordash extends StatelessWidget {
  const donordash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user =  FirebaseAuth.instance.currentUser!;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
              accountName: Container(
                child: Text("Name"),
              ),
              accountEmail:Text('Number'),
              otherAccountsPictures: const [
                CircleAvatar(
                  child: Icon(Icons.person_add),
                ),
              ],
            ),
            ListTile(
              tileColor: Colors.grey[200],
              leading: Icon(Icons.home),
              title: Text("Dashboard"),
            ),
            ListTile(
              leading: Icon(Icons.receipt_long),
              title: Text("Results"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: ((context) => donorr()),
                    ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.bloodtype),
              title: Text("Blood Request"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => donorbr()),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.bloodtype_outlined),
              title: Text("Blood Appeal"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => donora(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => donorn(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.vaccines),
              title: Text("Vaccines"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => vaccines(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("My Account"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => account(),
                  ),
                );
              },
            ),
            Container(
              width: 20,
              margin: EdgeInsets.symmetric(horizontal:50),
              padding: EdgeInsets.symmetric(vertical:50),

              child: ElevatedButton(
                child: Text('signout') ,
                onPressed: (){
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context)=> Center(child: CircularProgressIndicator(),)
                  );
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
      appBar: AppBar(
        title: Text('Medically Fit'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.bloodtype)
            ,onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => donorbr(),
              ),
            );
          },),
          IconButton(
            icon: Icon(Icons.notifications)
            ,onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => donorn(),
              ),
            );
          },),
        ],

      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            Padding(

              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('Dashboard', style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  Container(
                    child: Column(
                      children: const [
                        Text('Credits',
                            style: TextStyle(
                              fontSize: 15,
                            ),),
                       Text(' pending' , style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 20,
                       ),),

                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 380,
              height: 150,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey[300],

                border: Border(
                  top: BorderSide(width: 12.0, color: Colors.red.shade400),
                  bottom: BorderSide(width: 12.0, color: Colors.red.shade400),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("pending......",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text("Last Donation",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400
                  ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.black,
                        elevation: 0
                      ),
                        onPressed: (){},
                        label: Text('Learn More',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        icon: Icon(Icons.forward),

                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 380,
              height: 160,

              margin:EdgeInsets.all(15),
              padding:EdgeInsets.symmetric(vertical: 5),

              decoration: BoxDecoration(
                color: Colors.grey[300],

                border: Border(
                  top: BorderSide(width: 12.0, color: Colors.green.shade500),
                  bottom: BorderSide(width: 12.0, color: Colors.green.shade500),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("pending........",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text("Next Donation",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400
                  ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.black,
                        elevation: 0
                      ),
                        onPressed: (){},
                        label: Text('Learn More',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        icon: Icon(Icons.forward),

                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 380,
              height: 150,
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding:EdgeInsets.symmetric(vertical: 5),

              decoration: BoxDecoration(
                color: Colors.grey[300],

                border: Border(
                  top: BorderSide(width: 12.0, color: Colors.lightBlue.shade500),
                  bottom: BorderSide(width: 12.0, color: Colors.lightBlue.shade500),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Results",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  // Text("Results",
                  // style: TextStyle(
                  //   fontSize: 25,
                  //   fontWeight: FontWeight.w400
                  // ),
                  // ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.black,
                        elevation: 0
                      ),
                        onPressed: (){},
                        label: Text('Learn More',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        icon: Icon(Icons.forward),

                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
