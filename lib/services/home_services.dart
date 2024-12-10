import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeServices {

    //product calling api//
  Future<http.Response> getProducts() async {
    String url = "https://fakestoreapi.com/products";

    http.Response response = await http.get(Uri.parse(url));

    return response;
  }
        //categories api  calling//
  Future<http.Response>getCategories()async{

     String url="https://fakestoreapi.com/products/categories";

        http.Response  response=await http.get(Uri.parse(url));

           return response;
  }

     //get products  api//

  Future<http.Response>getProductsByCategory(String category) async{

    String url="https://fakestoreapi.com/products/category/${category}";

    http.Response response =await http.get(Uri.parse(url));

      return response;


  }

   Future<http.Response>postProduct(Map<String,dynamic>product)async{

     String url="https://fakestoreapi.com/products";
     
   http.Response response=await http.post(Uri.parse(url),body: json.encode(product));


     return  response;

     
   }


  Future<http.Response>UpdateProduct(Map<String,dynamic>product,String Id)async{

    String url="https://fakestoreapi.com/products/${Id.toString()}";

    http.Response response=await http.put(Uri.parse(url),body: json.encode(product));


    return  response;


  }


  Future<http.Response>DeleteProduct(String Id)async{

    String url="https://fakestoreapi.com/products/${Id.toString()}";

    http.Response response=await http.delete(Uri.parse(url),);


    return  response;


  }




}
