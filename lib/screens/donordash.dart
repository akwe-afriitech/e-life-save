import 'package:e_life_saver/screens/account.dart';
import 'package:e_life_saver/screens/donora.dart';
import 'package:e_life_saver/screens/donorbr.dart';
import 'package:e_life_saver/screens/donorn.dart';
import 'package:e_life_saver/screens/donorr.dart';
import 'package:e_life_saver/screens/init.dart';
import 'package:e_life_saver/screens/vaccines.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              currentAccountPicture: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              accountName: Container(
                child:  Text("Name: ${user.displayName}"),
              ),
              accountEmail:const Text('Number: pending....'),
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
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text("Results"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: ((context) => const donorr()),
                    ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.bloodtype),
              title: const Text("Blood Request"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const donorbr()),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.bloodtype_outlined),
              title: const Text("Blood Appeal"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const donora(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text("Notifications"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const donorn(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.vaccines),
              title: const Text("Vaccines"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const vaccines(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text("My Account"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const account(),
                  ),
                );
              },
            ),
            Container(
              width: 20,
              margin: const EdgeInsets.symmetric(horizontal:50),
              padding: const EdgeInsets.symmetric(vertical:50),

              child: ElevatedButton(
                child: const Text('signout') ,
                onPressed: (){
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context)=> const Center(child: CircularProgressIndicator(),)
                  );
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
      appBar: AppBar(
        title: const Text('Medical Info'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.bloodtype)
            ,onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const donorbr(),
              ),
            );
          },),
          IconButton(
            icon: const Icon(Icons.notifications)
            ,onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const donorn(),
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
                    child: const Text('Dashboard', style: TextStyle(
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
              margin: const EdgeInsets.symmetric(horizontal: 15),
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
                  const Text("pending......",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const Text("Last Donation",
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
                        label: const Text('Learn More',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        icon: const Icon(Icons.forward),

                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 380,
              height: 160,

              margin:const EdgeInsets.all(15),
              padding:const EdgeInsets.symmetric(vertical: 5),

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
                  const Text("pending........",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const Text("Next Donation",
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
                        label: const Text('Learn More',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        icon: const Icon(Icons.forward),

                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 380,
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding:const EdgeInsets.symmetric(vertical: 5),

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
                  const Text("Results",
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
                        label: const Text('Learn More',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        icon: const Icon(Icons.forward),

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
