import 'dart:collection';
import 'dart:developer';

import 'package:demogetx/network/RestClient.dart';
import 'package:demogetx/resource/utils.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'dialog/dialog.dart';
import '../resource/enum.dart';
import '../network/network_utils.dart';

class BaseController extends GetxController {
  Rx<Status> status = Status.loading.obs;
  late Map<String, dynamic> map;
  RestClient? client;
  bool endPoint = false;

  @override
  Future<void> onInit() async {
    await initialData();
    super.onInit();

  }

  initialData() async {
    setStatus(Status.loading);
    await getData();
  }

  getData() async {
    bool check = await NetworkUtils.hasConnection();
    try {
      client = RestClient(await NetworkUtils.getDioClient());
      await getDataSuccessFromAPI();
    } catch (onError) {
      catchError(onError);
    }
    if (check) { } else {
      setStatus(Status.fail);
    }
  }

  catchError(Object onError) async {
    switch (onError.runtimeType) {
      case DioError:
        final res = (onError as DioError).response;
        try {
          if (res?.statusCode != null) {
            log('aaaaaaaaaaaaaaaaaaaaaaaaaaa' + res!.statusCode.toString());
          }
          Utils.showToast('${res!.statusCode}\n${res.statusMessage}');
        } catch (e) {}

        if (res?.statusCode == 401) {
        } else if (res?.statusCode == 502) {
          setStatus(Status.success);
          if (AlertDialogAnimated.alertDialogAnimated == null) {
            AlertDialogAnimated.getInstance();
            AlertDialogAnimated.alertDialogAnimated = null;
            Get.back();
          }
        } else if (res?.statusCode == 403) {
          setStatus(Status.success);
          if (AlertDialogAnimated.alertDialogAnimated == null) {
            AlertDialogAnimated.getInstance();
            AlertDialogAnimated.alertDialogAnimated = null;
            setStatus(Status.success);
            Get.back();
          }
        } else {
          setStatus(Status.fail);
        }
        break;
      default:
    }
  }

  Future<void> handleDelay(int milliseconds) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
  }

  getDataSuccessFromAPI() {}


  getParameters() {
    map = HashMap<String, dynamic>();
  }

  void setEndPoint(bool condition) {
    endPoint = condition;
  }

  void setStatus(Status s) {
    status.value = s;
  }
}
