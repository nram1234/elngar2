
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../controller/notification_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(),permanent: true);


    Get.put<NotificationController>(NotificationController(),permanent: true);


  }
}
