
import 'package:elngar/scr/binding/home_binding.dart';
import 'package:elngar/scr/binding/login_binding.dart';
import 'package:elngar/scr/login.dart';
import 'package:elngar/scr/welcome.dart';
import 'package:elngar/utility/all_string_const.dart';
import 'package:elngar/utility/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:workmanager/workmanager.dart';
import 'middleware/auth_middleware.dart';
import 'nottoad/Demo.dart';
import 'nottoad/resize.dart';
import 'nottoad/singggg.dart';
import 'scr/binding/holiday_equest_binding.dart';
import 'scr/holidayRequest/holiday_request_scr.dart';
import 'scr/home.dart';

void main() async{

    WidgetsFlutterBinding.ensureInitialized();

    await GetStorage.init();

    print("token in start ${SecureStorage.readSecureData(AllStringConst.Token)}");
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
