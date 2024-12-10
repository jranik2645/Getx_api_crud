import 'package:e_commerapi/Utils/categories_shimmer.dart';
import 'package:e_commerapi/controller/home_Controller.dart';
import 'package:e_commerapi/model/product_model.dart';
import 'package:e_commerapi/post_action_page/action_page.dart';
import 'package:e_commerapi/view/product_details_page.dart';
import 'package:e_commerapi/view/product_view_by_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/product_shimmer.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Products"),
         actions: [
             Padding(
               padding: const EdgeInsets.only(right: 8.0),
               child: InkWell(
                  onTap: (){
                    Get.to(ActionPage());
                  },
                 child: CircleAvatar(
                    backgroundColor: Colors.deepOrange,
                    radius: 15.0,
                    child: Icon(Icons.add, color: Colors.white,),
                 ),
               ),
             )
         ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: GetBuilder<HomeController>(
              builder: (_) {
                return homeController.isCategoryLoading
                    ? CategoriesShimmer()
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                homeController.getProductsByCategory(
                                    homeController.categories[index]
                                        .toString());
                                Get.to(ProductViewByCategory(homeController
                                    .categories[index]
                                    .toUpperCase()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.0, right: 10),
                                    child: Text(
                                      homeController.categories[index]
                                          .toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GetBuilder<HomeController>(builder: (_) {
              return homeController.isLoading
                  ? ProductShimmer()
                  : Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          shrinkWrap: true,
                          itemCount: homeController.products.length,
                          itemBuilder: (context, index) {
                            ProductModel product =
                                homeController.products[index];
                            return GestureDetector(
                              onTap: (){
                                Get.to(ProductDetailsPage(
                                  product
                                ));
                              },
                              child: Card(
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
                              )),
                            );
                          }),
                    );
            }),
          ),
        ],
      ),
    );
  }
}
