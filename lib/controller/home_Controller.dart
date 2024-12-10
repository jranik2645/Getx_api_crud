import 'dart:convert';

import 'package:e_commerapi/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerapi/services/home_services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  //HomeServices homeServices=HomeServices();
  late HomeServices homeServices;

  List<ProductModel> products = [];
  List<String> categories = [];

  List<ProductModel> productsByCategory = [];

  bool isCategoryLoading = false;
  bool isLoading = false;

  bool isProductsByCategoryLoading = false;

   bool  isProductPostLoading=false;
   bool isUpdateProductLoading=false;
   bool isDeleteProductLoading=false;

  @override
  void onInit() {
    homeServices = HomeServices();

    getCategories();
    getProducts();
    getProductsByCategory(categories.toString());

    super.onInit();
  }


      void postProduct(Map<String,dynamic>product)async{

        try{
            isProductPostLoading =true;
            update();

            http.Response response= await  homeServices.postProduct(product);

            if(response.statusCode==200){
              print(response.body);
              isProductPostLoading=false;
              update();

            }else{
              print(response.statusCode);

            }


        }catch(e){}

      }


      //update product page//

  void UpdateProduct(Map<String,dynamic>product, String Id)async{

    try{
      isUpdateProductLoading =true;
      update();

      http.Response response= await  homeServices.UpdateProduct(product, Id);

      if(response.statusCode==200){
        print(response.body);
        isUpdateProductLoading=false;
        update();

      }else{
        print(response.statusCode);

      }


    }catch(e){}

  }

  void DeleteProduct( String Id)async{

    try{
      isDeleteProductLoading =true;
      update();

      http.Response response= await  homeServices.DeleteProduct( Id);

      if(response.statusCode==200){
        print(response.body);
        isDeleteProductLoading=false;
        update();

      }else{
        print(response.statusCode);

      }


    }catch(e){}

  }




  //date show in products//
  void getProducts() async {
    try {
      isLoading == true;
      update();
      http.Response response = await homeServices.getProducts();

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (int i = 0; i < data.length; i++) {
          products.add(ProductModel.fromJson(data[i]));
        }
        isLoading == false;
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  void getProductsByCategory(String category) async {
    try {
      isProductsByCategoryLoading = true;
      update();
      http.Response response =
          await homeServices.getProductsByCategory(category);

      var data = jsonDecode(response.body);

      for (int i = 0; i < data.length; i++) {
        productsByCategory.add(ProductModel.fromJson(data[i]));


      }
      print(productsByCategory);
      isProductsByCategoryLoading = false;
      update();
    } catch (e) {}
  }

  //data facing in categories//
  void getCategories() async {
    try {
      isCategoryLoading = true;
      update();

      http.Response response = await homeServices.getCategories();
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (int i = 0; i <data.length; i++) {
          isCategoryLoading = false;
          categories.add(data[i]);
          update();
        }
      } else {
        isCategoryLoading = false;
        print("Something wrong");
         update();
      }
    } catch (e) {
      print(e);
      isCategoryLoading = false;
      update();
    }
  }
}
