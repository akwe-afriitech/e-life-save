import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class donorn extends StatelessWidget {
  const donorn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              child: Text('No New Notifications',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 390,
              height: 500,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Text("No new notifications yet"),
            ),

          ],
        ),
      ),
    );
  }
}
