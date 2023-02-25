import 'package:e_life_saver/screens/donorreg.dart';
import 'package:e_life_saver/screens/requestreg.dart';
import 'package:flutter/material.dart';

class init extends StatelessWidget {
  const init({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 350,
            child: Column(
              children: [
                Container(
                  child: Image(image:AssetImage('assets/logo.png'),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(280, 60),
                      shape: StadiumBorder(),
                    ),
                      onPressed: (){
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context)=> Center(child: CircularProgressIndicator(),)
                        );
                        Navigator.push(context,
                            MaterialPageRoute(builder:
                        (context) =>
                            requestreg()
                        ),);
                      },
                      child: Text('Request',
                      style:TextStyle(
                        fontSize: 17
                      ) ,
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(280,60),
                        shape: StadiumBorder(),
                      ),
                      onPressed: (){
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context)=> Center(child: CircularProgressIndicator(),)
                        );
                        Navigator.push(context,
                          MaterialPageRoute(builder:
                              (context) =>
                              donorreg(),
                          ),);
                      },
                      child: Text('Donate',
                      style: TextStyle(
                        fontSize: 17
                      ),
                      )
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
