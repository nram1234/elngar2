// HolidayRequestScr
//

import 'package:get/get.dart';

import '../controller/holiday_request_controller.dart';

class HolidayRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HolidayRequestController>(HolidayRequestController());
  }
}
