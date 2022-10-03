
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../controller/notification_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());


    Get.put<NotificationController>(NotificationController());


  }
}
