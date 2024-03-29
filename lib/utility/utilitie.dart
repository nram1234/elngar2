import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}






 getPositionAsStream() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 1,
  );
  StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
          (Position? position) async{
// if(position!=null){
//   double d=await    getdestance(pos: position);
// }

        print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');

      });
}
Future <int>getdestance({required Position pos,required double  pranchLong,required double pranchlat}) async {

  Position? currentUserLoc;
 // currentUserLoc =await _determinePosition(); //
  double destans=await Geolocator.distanceBetween(pos.latitude, pos.longitude, pranchlat,  pranchLong );
  //await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

 // print("destansdestansdestansdestans       ${destans.toInt()}             ");
  return destans.toInt();
}

Future <Position?>getLoction( ) async {

  Position? currentUserLoc;
  // currentUserLoc =await _determinePosition(); //
  //double destans=Geolocator.getCurrentPosition( desiredAccuracy: );
  LocationPermission
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

  }else{
   if( await Geolocator.isLocationServiceEnabled()){
     currentUserLoc=  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   }else{
     Get.snackbar("خطاء", "يجب تشغيل خدمة تحديد المواقع");
   }


  }


  return currentUserLoc;
}