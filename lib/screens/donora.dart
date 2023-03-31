import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class donora extends StatelessWidget {
  const donora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Column(
          // ossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                // border: Border.all(width: 3, color: Colors.red)
              ),
              child: const Text('Appeal History',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 390,
              height: 390,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey),
                borderRadius: BorderRadius.circular(20)
              ),
              child: const Text("No aapeals yet"),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                  padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 60),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: (){
                    },
                    child: const Text('Make New Appeal',
                      style:TextStyle(
                          fontSize: 20
                      ) ,
                    )
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Make a new blood appeal.Fill the form below to send '
                    'a request',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
