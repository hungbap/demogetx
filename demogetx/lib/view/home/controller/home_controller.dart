import 'package:demogetx/model/auto.dart';
import 'package:demogetx/utils/basecontroller.dart';
import 'package:demogetx/view/detail_home/detail_ui/detail.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../resource/enum.dart';

class HomeController extends BaseController{

  Data? data2;
  var string = ''.obs;
  var listData = <Data>[].obs;

  @override
 initialData() async  {
    await handleDelay(500);
    await super.initialData();
  }
  @override
  getDataSuccessFromAPI() async{
    var data1 = await client!.getContact(getParameters());
    listData.value = data1.data!;
    print('${listData[0].submissionUrl}');
    setEndPoint(listData.length > 10);
    setStatus(Status.success);
  }
  @override
  getParameters() {
    super.getParameters();
    map['submission_id'] = 1;
    return map;
  }
}