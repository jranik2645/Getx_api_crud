import 'package:e_commerapi/Utils/product_shimmer.dart';
import 'package:e_commerapi/controller/home_Controller.dart';
import 'package:e_commerapi/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductViewByCategory extends StatelessWidget {
  String category = "";
  ProductViewByCategory(this.category);

  HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Container(
        child: GetBuilder<HomeController>(builder: (_) {
          return homeController.isLoading
              ? ProductShimmer()
              : Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      shrinkWrap: true,
                      itemCount: homeController.productsByCategory.length,
                      itemBuilder: (context, index) {
                        ProductModel product =
                            homeController.productsByCategory[index];
                        return Card(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.network(
                                product.image!,
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                product.title!,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Text("Price:"),
                                      Text(
                                        product.price.toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.start,
                                        color: Colors.orange,
                                        size: 15,
                                      ),
                                      Text(
                                        product.rating!.rate.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ));
                      }),
                );
        }),
      ),
    );
  }
}
