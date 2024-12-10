import 'package:e_commerapi/controller/home_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class UpdateProductPage extends StatelessWidget {
  UpdateProductPage({super.key});

  final TextEditingController productClt = TextEditingController();
  final TextEditingController productId = TextEditingController();
  final TextEditingController priceClt = TextEditingController();
  final TextEditingController descriptinClt = TextEditingController();

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                controller: productId,
                keyboardType:TextInputType.number ,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Product Id",
                  contentPadding: EdgeInsets.only(
                    left: 10.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                controller: productClt,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Product Name",
                  contentPadding: EdgeInsets.only(
                    left: 10.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                controller: priceClt,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Price",
                  contentPadding: EdgeInsets.only(
                    left: 10.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                controller: descriptinClt,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Product description",
                  contentPadding: EdgeInsets.only(
                    left: 10.0,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Map<String, dynamic> product = {
                  'name': productClt.text,
                  'price': priceClt.text,
                  'description': descriptinClt.text,
                };
                homeController.UpdateProduct(product, productId.text);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.deepOrangeAccent,
                ),
                width: Get.width,
                height: 45,
                child: Center(
                  child: Text(
                    'Update Product',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
