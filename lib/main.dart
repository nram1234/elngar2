
import 'package:elngar/scr/binding/home_binding.dart';
import 'package:elngar/scr/binding/login_binding.dart';
import 'package:elngar/scr/login.dart';
import 'package:elngar/scr/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'middleware/auth_middleware.dart';

import 'scr/binding/holiday_equest_binding.dart';
import 'scr/holidayRequest/holiday_request_scr.dart';
import 'scr/home.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  //print("Handling a background message: ${message.notification.title}");
  print("Handling a background message: ${message.messageId}");
}
void main() async{



    // await Workmanager().initialize(
    //   callbackDispatcher,isInDebugMode: true,
    // );
    // await Workmanager().registerPeriodicTask(
    //   "1",
    //   fetchBackground,
    //   frequency: Duration(seconds: 10),
    //   constraints: Constraints(
    //     networkType: NetworkType.connected,
    //   ),
    // );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  //await FirebaseMessaging.instance;
  await GetStorage.init();
   // await FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(  MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp( debugShowCheckedModeBanner: false,
      title: ' ',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
// home:     Home()//Login()//Welcom()// const MyHomePage(title: 'Flutter Demo Home Page'),
         getPages: [
        GetPage(name: "/", page: () =>
            const Welcome(),
            middlewares: [
              AuthMiddleWare()
            ]

        )
        ,
             GetPage(name: "/Home", page: () =>
                 Home(),
                 binding: HomeBinding())
             ,
             GetPage(name: "/Login", page: () =>
                 Login(),
                 binding: LoginBinding())

           ,
           GetPage(name: "/HolidayRequest", page: () =>
               HolidayRequestScr(),
               binding: HolidayRequestBinding())

            ],);
  }
}
