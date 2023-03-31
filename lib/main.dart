import 'package:e_life_saver/auth/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //       apiKey: "AIzaSyBf8PRmQlQTRA-Kyxl9kcJ2D1Abwgyg3Yg",
  //       authDomain: "e-life-saver-1ed72.firebaseapp.com",
  //       projectId: "e-life-saver-1ed72",
  //       storageBucket: "e-life-saver-1ed72.appspot.com",
  //       messagingSenderId: "961784242670",
  //       appId: "1:961784242670:web:0a532de237f57266df6eff",
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.red
      ),
      debugShowCheckedModeBanner: false,
      home: mainpage(),
    );
  }
}



