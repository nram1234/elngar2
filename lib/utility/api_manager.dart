// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:get/get.dart'  as a ;
//
//
// import 'abstract_json_resource.dart';
// import 'dio_singleton.dart';
//
//
// abstract class ApiManager {
//   final DioSingleton dioSingleton = DioSingleton();
//   final storge= a.Get.find<SecureStorage>();
//   /// Returns the API URL of current API ressource
//   String apiUrl();
//
//   AbstractJsonResource fromJson(data);
//
//   Future<dynamic> getData() async {
//
//     AbstractJsonResource jsonList;
//     var data;
//     await dioSingleton.dio
//         .get( apiUrl()   )
//         .then((value) {
//       data = value.data;
//     });
//     jsonList = fromJson(data);
//
//     return jsonList;
//   }
// /// POST DATA TO SERVER
//   Future<Response<dynamic>> post(dataToPost) async {
//     print(jsonEncode(dataToPost));
//     Options options = Options(headers: { "Accept": "application/json",
//
//       'Content-Type': 'application/json',
//       'X-WSSE':  dataToPost['X-WSSE'],
//     },);
//     return dioSingleton.dio
//         .post(
//       apiUrl(),
//       data: jsonEncode(dataToPost),
//       options: options
//
//       // Options(
//       //     followRedirects: false,
//       //     validateStatus: (status) {
//       //       return status < 500;
//       //     }),
//     )
//         .then((value) {
//           return value;
//     });
//   }
//
//   /// POST DATA TO SERVER
//   Future<Response<dynamic>> securePost({dataToPost ,wss}) async {
//     //generer le wsse
//     print(jsonEncode(dataToPost));
//     Options options = Options(headers: {"Accept": "application/json",
//
//       'Content-Type': 'application/json',
//       'X-WSSE':  wss,
//     });
//     return dioSingleton.dio
//         .post(
//       apiUrl(),
//       data: jsonEncode(dataToPost),
//       options: options
//
//       // Options(
//       //     followRedirects: false,
//       //     validateStatus: (status) {
//       //       return status < 500;
//       //     }),
//     )
//         .then((value) {
//           return value;
//     });
//   }
//
//   Future get(Map<String, dynamic> dataToPost) async {
//     Options options = Options(headers: {
//
//       'Content-Type': 'application/json',
//       'X-WSSE': dataToPost['X-WSSE'],
//     });
//     return dioSingleton.dio.get(apiUrl(), options: options);
//   }
//   /// del DATA TO SERVER
//   Future<Response<dynamic>> delPost() async {
//     //generer le wsse
//
//     Options options = Options(headers: {"Accept": "application/json",
//
//       'Content-Type': 'application/json',
//
//     });
//     return dioSingleton.dio
//         .delete(
//         apiUrl() ,
//
//         options: options
//
//       // Options(
//       //     followRedirects: false,
//       //     validateStatus: (status) {
//       //       return status < 500;
//       //     }),
//     )
//         .then((value) {
//       return value;
//     });
//   }
// }
