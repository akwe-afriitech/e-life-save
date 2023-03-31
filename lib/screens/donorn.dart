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
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                // border: Border.all(width: 3, color: Colors.red)
              ),
              child: const Text('No New Notifications',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  color: Colors.red,
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
              child: const Text("No new notifications yet"),
            ),

          ],
        ),
      ),
    );
  }
}
