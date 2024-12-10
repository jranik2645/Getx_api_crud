import 'package:e_commerapi/delete_Page/delete_product_page.dart';
import 'package:e_commerapi/main.dart';
import 'package:e_commerapi/post_action_page/add_product_page.dart';
import 'package:e_commerapi/updateproductpage/update_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ActionPage extends StatelessWidget {
  const ActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                 Get.to(AddProductPage());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent),
                child: Text(
                  "Add Product",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.put(UpdateProductPage());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent),
                child: Text(
                  "Update Product",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.to(DeleteProductPage());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent),
                child: Text(
                  "Delete Product",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
