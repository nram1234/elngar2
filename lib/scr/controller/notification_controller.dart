import 'package:get/get.dart';

import '../../rep/api/all_notifications.dart';
import '../../rep/json_model/all_notifications_model.dart';
import '../../utility/all_string_const.dart';
import '../../utility/storage.dart';

class NotificationController extends GetxController{


  AllNotificationsModel? allNotificationsModel;



      getAllAotifications(){
        AllAotificationsAPI allAotificationsAPI=AllAotificationsAPI();
        allAotificationsAPI.data="token=${SecureStorage.readSecureData(AllStringConst.Token)}";
allAotificationsAPI.getData().then((value) {
  allNotificationsModel=value as AllNotificationsModel;
  update();
});



      }

}