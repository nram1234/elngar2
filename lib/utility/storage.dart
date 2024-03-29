

import 'package:get_storage/get_storage.dart';

class SecureStorage {

  static final   box = GetStorage();

 static Future? writeSecureData({required String key,required String value})  async {


    var writeData = await box.write( key,value);
    return writeData;
  }
  static Future? writeSecureDataINT({required String key,required int? value})  async {

    if(value!=null){
      await box.write( key,value);
    }


  }
  static  int? readSecureDataINT(String key)   {

    var readData =   box.read( key);
    return readData;
  }
  static  Future? writeBoolData({required String key,required bool value})  async {


    var writeData = await box.write( key,value);
    return writeData;
  }
  static bool  readBoolData(String key)   {

    var readData =   box.read( key);
    return readData??false;
  }
  static  String? readSecureData(String key)   {

    var readData =   box.read( key);
    return readData;
  }
  static Future? deleteSecureData(String key) async{

    var deleteData = await box.remove( key);
    return deleteData;
  }

  static  Future writeSecureJsonData({required String key, value})  async {


    var writeData = await box.write( key,value);
    return writeData;
  }
 static Map<String,dynamic>? readSecureJsonData(String key)   {

    var readData =   box.read( key);
    return readData;
  }
}