import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'basecontroller.dart';

class detailController extends BaseController{
  var one;
  @override
  Future<void> onInit() {
    one = Get.arguments;
    // TODO: implement onInit
   print('$one');
    return super.onInit();

  }
  @override
  initialData() async  {

    await handleDelay(500);
    await super.initialData();
  }
}