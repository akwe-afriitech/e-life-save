<div align='center'>
    <h1><b></b> E Life Saver</h1>
    <img src='' width='250' height='250' />
    <p>An online health application to help people in need of blood send request to all blood donors out there close to their location in order to donate to them and save their lifes 
more information coming up with the common work flow documnent for those who are interested in contributing and how to contribute eventually
</p>

</div>

* For Mobile:[https://github.com/akwe-afriitech/e-life-save/](https://github.com/akwe-afriitech/e-life-save) (stable channel)


## Getting Started /🗒️ **INSTALLATION**


### This code is running on the following versions

** Flutter version `3.7.8` (Channel stable)
** Android SDK `33.0.0` (Android SDK version 33.0.0 or higher)
** gradle version `8.0.2`
** Windows Version `windows 10` (Installed a version of Windows 10 or higher)
** Android Studio version `2020.3`  (or higher)
** VS Code version `1.76.1` (or higher)


### Local Installation 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/akwe-afriitech/e-life-save/
```

**Step 2:**
Go to the projects directory in your IDE's terminal by using `cd` then paste directory path to root file of the project

```
cd 'paste path to root file of the project'
```


**Step 3:**

From the projects root, execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 4:**

After all dependencies have being gotten `run` the app on emulator or mobile using the the command 

```
flutter run lib/main.dart
```
Wait for app to build and proceed to test.



## E Life Saver Features:

* Splash
* Login
* Signup
* Home
* Send Blood Request
* Database
* Test Results
* Vacination Dates
* Blood Donation Dates
* Next Blood Donation date


### Up-Coming Features:

* Google Maps Location for Hospitals
* User firebase push Notifications
* Connectivity Support
* Background Fetch Support

### Libraries & Tools Used

** [firebase Database](firebase.com)


### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- auth/
|- screens/
|- services/
|- main.dart

```

Now, lets dive into the lib folder which has the main code for the application.

```
1- auth - All the login functionality and navigation functionality to the required screens
2- screens — Contains all the ui of your project, contains sub directory for each screen.
3- services — Contains the push notification services we are to implement
8- main.dart - This is the starting point of the application. All the applications level of configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### auth

This directory all the login functionality and navigation functionality to the required screens. A separate file is created for each type as shown in example below:

```
auth/
|- mainpage.dart
|- test.dart
|- utils.dart
```

### UI

This directory contains all the ui of your application. Each screen is located in a separate folder making it easy to combine group of files related to that particular screen. All the screen specific widgets will be placed in `widgets` directory as shown in the example below:

```
ui/
|- .....

```

### services
 Contains the push notification services we are to implement

```
services/
|- push_notification_services/
|- push_notification_services.dart
 
```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```import 'package:e_life_saver/auth/mainpage.dart';
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
```



## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the E life Saver project then please feel free to submit an issue and/or pull request 🙂


