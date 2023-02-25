// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// class PushNotificationService{
//
//   final FirebaseMessaging _fcm = FirebaseMessaging();
//
//   await initialise() async{
//     _fcm.configure(
//       onMessage:(Map <String, dynamic> message) async{
//         print('onMessage: $message');
//       },
//         onMessage:(Map <String, dynamic> message) async{
//       print('onLaunch: $message');
//     },
//         onMessage:(Map <String, dynamic> message) async{
//           print('onResume: $message');
//         }
//     );
//   }
// }