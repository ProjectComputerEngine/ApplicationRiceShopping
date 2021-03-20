import 'dart:convert';
import 'package:ApplicationRiceShopping/Connection.dart';
import 'package:flutter/material.dart';
import 'ProductModule.dart';

class ProductControl extends Connection {
    List<Product> productlist = [];


    Future<dynamic> productAll(BuildContext context) async {
      String data = await super.ProductAll(context: context);
      var jsonData = await jsonDecode(data);
      print('Read Data Complete');
      return jsonData;
      //  for (int i = 0; i < jsonData.length; i++)
      // {
      //   await _LoadProductModule(jsonData[i]);
      // }
      //
      // return productlist;
    }

  Product LoadProductModule(dynamic jsonData)  {

        Product product = Product(
          ID: jsonData['ID'],
          Name: jsonData['Name'],
          Num: jsonData['Num'],
          DateStart: jsonData['DateStart'],
          Recommend: jsonData['Detail'],
          Pomotion: jsonData['Pomotion'],
          Price: jsonData['Price'],
          Size: jsonData['Size'],
          Star: jsonData['Star'],
          Storage: jsonData['Storage'],
          Note: jsonData['Trl'],
          UrlImage1: jsonData['UrlImage1'],
          UrlImage2: jsonData['UrlImage2'],
          UrlImage3: jsonData['UrlImage3'],
          Weight: jsonData['Wight'],);
        // productlist.add(product);
    return product;

  }
}
