import 'package:demogetx/view/detail_home/detail_controller/detailcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class Detail extends GetWidget<detailController> {
  final _controller = Get.lazyPut(() => detailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detail demo'),
      ),
      body: Container(
        child: Column(
          children: [
           Text('${controller.one[0]}'),
            Text('${controller.one[1]}'),
            Center(child: Image.network('${controller.one[2]}', height: 500,)),
          ],
        ),
      ),
    );
  }
}
