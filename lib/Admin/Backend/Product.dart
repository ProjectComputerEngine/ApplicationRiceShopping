import 'dart:convert';
import 'package:ApplicationRiceShopping/Connection.dart';
import 'package:flutter/material.dart';
import 'ProductModule.dart';

class ProductControl extends Connection {
    List<Product> productlist = [];


    Future<dynamic> productAll(BuildContext context) async {
      productlist = [];
      String data = await super.ProductAll(context: context);
      var jsonData = jsonDecode(data);
      for (int i = 0; i < jsonData.length; i++)
      {
        Product product = Product(
          ID: jsonData[i]['ID'],
          Name: jsonData[i]['Name'],
          Num: jsonData[i]['Num'],
          DateStart: jsonData[i]['DateStart'],
          Detail: jsonData[i]['Detail'],
          Pomotion: jsonData[i]['Pomotion'],
          Price: jsonData[i]['Price'],
          Size: jsonData[i]['Size'],
          Star: jsonData[i]['Star'],
          Storage: jsonData[i]['Storage'],
          Trl: jsonData[i]['Trl'],
          UrlImage1: jsonData[i]['UrlImage1'],
          UrlImage2: jsonData[i]['UrlImage2'],
          UrlImage3: jsonData[i]['UrlImage3'],
          Wight: jsonData[i]['Wight'],);
        productlist.add(product);
      }
      return productlist;
    }

  _LoadProductModule(dynamic jsonData) {
    return Product(
        ID: jsonData['ID'],
        Name: jsonData['Name'],
        Num: jsonData['Num'],
        DateStart: jsonData['DateStart'],
        Detail: jsonData['Detail'],
        Pomotion: jsonData['Pomotion'],
        Price: jsonData['Price'],
        Size: jsonData['Size'],
        Star: jsonData['Star'],
        Storage: jsonData['Storage'],
        Trl: jsonData['Trl'],
        UrlImage1: jsonData['UrlImage1'],
        UrlImage2: jsonData['UrlImage2'],
        UrlImage3: jsonData['UrlImage3'],
        Wight: jsonData['Wight'],);
  }
}
