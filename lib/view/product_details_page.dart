
import 'package:e_commerapi/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ProductDetailsPage extends StatelessWidget {

  ProductModel productModel;
   ProductDetailsPage(this.productModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.transparent,
         elevation: 0,
       ),
       body: Container(
          child: Column(
             children: [
               Image.network(productModel.image!,
                width: Get.width,
                 height: 200,
                 fit: BoxFit.cover,
               ),
                SizedBox(height: 10,),
               Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            productModel.title!,
                           style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                           ),
                           overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Text(productModel.price.toString()))
                  ],
               )
             ],
          ),
       ),

    );
  }
}
