import 'package:e_life_saver/screens/donordash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class account extends StatelessWidget {
  const account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width:130,
                    height: 130,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.red, width: 6.0),
                      borderRadius: BorderRadius.circular(20)
                    ),

                    child: Icon(Icons.person, size: 120,),
                  ),
                  Container(
                    width: 130,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text('bts',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30
                        ),),
                        Text('23423', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30
                        ),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width:150,
                        child: Text('Name :',style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: 250,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder()
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width:150,
                        child: Text('Phone :',style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: 250,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width:150,
                        child: Text('Email :',style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: 250,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width:150,
                        child: Text('City :',style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: 250,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width:150,
                        child: Text('Address :',style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: 250,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width:150,
                        child: Text('Old Password :',style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: 250,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width:150,
                        child: Text('New Password :',style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: 250,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 45),
                    shape: StadiumBorder(),
                  ),
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) =>
                          donordash()
                      ),);
                  },
                  child: Text('Update',
                    style:TextStyle(
                        fontSize: 20
                    ) ,
                  )
              ),
            )

          ],
        ),
      ),
    );
  }
}
