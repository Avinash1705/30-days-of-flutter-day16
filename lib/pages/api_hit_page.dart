import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_learn/models/apiModel/apiTestModel.dart';

class ApiHit extends StatelessWidget {
  const ApiHit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:"Api hit ".text.xl4.make(),
      ),
    );
  }
}

class HitIt{
  // var controller = Get.put(apiTestModel());
  // var responce = conn.get();

}
