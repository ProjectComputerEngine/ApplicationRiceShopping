import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart';
import 'package:ApplicationRiceShopping/Connection.dart';
import '../Widget/NewProductWidget.dart';
class AddDataProduct {
  String UrlImage;
  File file;
  // Uri url = Uri.parse('http://10.37.11.46:8080/upload/');
  var request =
  MultipartRequest('POST', Uri.parse('http://${Connection.server}/upload/'));

  Future<void> ReadFildPath(StreamController streamController) async {
    FilePickerResult result =
    await FilePicker.platform.pickFiles(type: FileType.image,allowMultiple: false);
    if (result != null) {
      file = File(result.files.single.path);
      print(file.path);
      UrlImage = file.path;
      streamController.add(file.path);

    } else {}
  }

  Future<void> AddData(
      {String name,
        String price,
        String weight,
        String width,
        String height,
        String dateStart,
        String storage,
        String recommend,
        String note,
        String num,
      BuildContext context}) async {
    request.fields['Name'] = name;
    request.fields['Num'] = num;
    request.fields['Price'] = price;
    request.fields['DateStart'] = dateStart;
    request.fields['Storage'] = storage;
    request.fields['Recommend'] = recommend;
    request.fields['Weight'] = weight;
    request.fields['Size'] = width + 'x' + height;
    request.fields['Note'] = note;
    await UploadFile(file,context);
  }

    Future<void> UploadFile(File _image,BuildContext context) async {
    bool complete  = true;
    var stream = ByteStream(DelegatingStream.typed(_image.openRead()));
    var length = await _image.length();
    var multipartFile = MultipartFile('image_file', stream, length,
        filename: basename(_image.path));
    request.files.add(multipartFile);

    request.send().then((response) async {
      response.stream.transform(utf8.decoder).listen((event) {
        print(event);

      });
    }).catchError((onError) {
      print(onError.toString());
      showMyDialog(context, 'เพิ่มสินค้าไม่สำเร็จ \n กรุณาลองใหม่อีกครั้ง');

    }).then((value){
      Navigator.pop(context);
      showMyDialog(context, 'เพิ่มสินค้าสำเร็จ');
    });
  }
}
