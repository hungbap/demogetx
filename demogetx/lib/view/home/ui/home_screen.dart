import 'package:demogetx/view/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../detail_home/detail_ui/detail.dart';
class HomeScreen extends GetWidget<HomeController> {

 HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('call demo'),
        backgroundColor: Colors.cyan,
      ),
      body: Obx(()=>ListView.builder(
        itemCount: controller.listData.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: (){
                  Get.to(Detail(),
                      arguments: [
                        controller.listData[i].submissionId,
                        controller.listData[i].submissionTitle,
                        controller.listData[i].submissionUrl],
                      );
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3)),
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text('+ ${controller.listData[i].submissionId}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:10),
                          child: Text('- ${controller.listData[i].submissionTitle}'),
                        ),
                        Image.network(controller.listData[i].submissionUrl!),
                        Text(controller.listData[i].permalink!),
                        Text('- ${controller.listData[i].author}'),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Text('${controller.listData[i].created} : '),
                              Text('${controller.listData[i].timestamp}'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          )),
    );
  }
}


