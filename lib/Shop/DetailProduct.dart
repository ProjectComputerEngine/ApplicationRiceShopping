import 'dart:async';

import 'package:ApplicationRiceShopping/Shop/BillMain.dart';

import 'Widget/MenuNavigator.dart';

// import './Backend/AddProduct.dart';
import 'package:flutter/material.dart';
import './Widget/NewProductWidget.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import './Backend/ProductModule.dart';

import 'package:localstorage/localstorage.dart';

class DetailProduct extends StatefulWidget {
  final Product product;

  DetailProduct({this.product});

  @override
  State<StatefulWidget> createState() {
    return NewProductState();
  }
}

class NewProductState extends State<DetailProduct> {
  int count = 0;
  TextEditingController controller = TextEditingController(text: '0');

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  // TextEditingController dateStartController = TextEditingController();
  TextEditingController storageController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController recommendController = TextEditingController();
  TextEditingController numController = TextEditingController();

  FocusNode nameNode;
  FocusNode priceNode;
  FocusNode weightNode;
  FocusNode widthNode;
  FocusNode heightNode;
  FocusNode numNode;
  FocusNode dateStartNode;
  FocusNode storageNode;
  FocusNode recommendNode;
  FocusNode noteNode;
  FocusNode saveNode;

  DateTime startDate;
  DateTime selectDate;

  LocalStorage localStorage;

  BehaviorSubject streamController;

  dynamic bill;

  _selectDate(BuildContext context, FocusNode nextNode) async {
    selectDate = await showDatePicker(
      context: context,
      initialDate: startDate, // Refer step 1
      firstDate: DateTime(startDate.year - 5),
      lastDate: DateTime(startDate.year + 5),
    );
    if (selectDate != null) {
      nextNode.requestFocus();
    }
    setState(() {});
  }

  void addCount() {
    setState(() {
      count++;
      controller.text = count.toString();
      print(count.toString());
    });
  }

  void commitCount() {
    setState(() {
      count = int.parse(controller.text);
      print(count.toString());
    });
  }

  Future<void> addProductToBill(String name,int num,double price,String ID) async {
    Navigator.of(context).pop();
    // Navigator.of(context).pop();

    // await localStorage.deleteItem('Bill');
    bill = await localStorage.getItem('BillDetail');

    List<Map<String, dynamic>> product = [{
      "ID": ID,
      "Name": name,
      "num": num,
      "price": price,
    }];
    if(bill == null){
      await localStorage.setItem('BillDetail', product);
      }
    else{
      bill = await localStorage.getItem('BillDetail');
      bill.add(product[0]);
      await localStorage.setItem('BillDetail', bill);
      }
  }
  void negativeCount() {
    setState(() {
      count < 1 ? null : count--;
      controller.text = count.toString();
      print(count.toString());
    });
  }

  @override
  void initState() {
    localStorage =LocalStorage('Bill');
    streamController = BehaviorSubject();
    startDate = DateTime.now();

    nameNode = FocusNode();
    priceNode = FocusNode();
    weightNode = FocusNode();
    widthNode = FocusNode();
    heightNode = FocusNode();
    numNode = FocusNode();
    dateStartNode = FocusNode();
    storageNode = FocusNode();
    recommendNode = FocusNode();
    noteNode = FocusNode();
    saveNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    setState(() {
      count = 0;
    });
    bill==null? null:localStorage.dispose();
    streamController.close();
    print('LocalStorage complete !');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: menu(),
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Color.fromRGBO(32, 50, 50, 10),
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                children: [BackButtons(), AddProductText()],
              ),
            ),
            Flexible(
              child: ListView(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    0,
                    MediaQuery.of(context).size.width * 0.05,
                    0),
                children: [
                  Container(
                    child: Text(
                      'รูป',
                      textAlign: TextAlign.left,
                      style: TextStyle(),
                    ),
                  ),
                  SpaceHeight(),
                  Container(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LargeImageBox(
                          content: Image.network(
                        widget.product.UrlImage1,
                      )),
                      SpaceWidth(),
                      TwoImageBox(
                          contact: Image.network(
                        widget.product.UrlImage1,
                      )),
                      SpaceWidth(),
                      TwoImageBox(
                          contact: Image.network(
                        widget.product.UrlImage1,
                      )),
                    ],
                  )),
                  SpaceHeight(),
                  Container(
                    child: Text(
                      'รายละเอียด',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SpaceHeight(),
                  SpaceHeight(),
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromRGBO(32, 50, 50, 10)),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        SpaceHeight(),
                        SpaceHeight(),
                        ProductNameTextField(
                          value: widget.product.Name.replaceAll('\\n', '\n'),
                          myNode: nameNode,
                          nextNode: priceNode,
                          name: nameController,
                        ),
                        PriceTextField(
                          value: widget.product.Price,
                          myNode: priceNode,
                          nextNode: weightNode,
                          price: priceController,
                        ),
                        WeightTextField(
                          value: widget.product.Weight,
                          myNode: weightNode,
                          nextNode: widthNode,
                          weight: weightController,
                        ),
                        SpaceText(),
                        SizePacketText(),
                        SpaceText(),
                        SizePacketTextField(
                          value1: widget.product.Size.split('x').first,
                          value2: widget.product.Size.split('x').last,
                          width: widthController,
                          height: heightController,
                          my1Node: widthNode,
                          my2Node: heightNode,
                          nextNode: numNode,
                        ),
                        SpaceText(),
                        IncressProductText(),
                        SpaceText(),
                        IncressProductTextField(
                          value: widget.product.Num,
                          myNode: numNode,
                          nextNode: dateStartNode,
                          num: numController,
                        ),
                        ProductionDateTextField(
                            myNode: dateStartNode,
                            dateselect: () => _selectDate(context, storageNode),
                            dateshow: widget.product.DateStart),
                        PlaceTextField(
                          value: widget.product.Storage,
                          myNode: storageNode,
                          nextNode: recommendNode,
                          storage: storageController,
                        ),
                        RecommendTextField(
                          value:
                              widget.product.Recommend.replaceAll('\\n', '\n'),
                          myNode: recommendNode,
                          nextNode: noteNode,
                          recommend: recommendController,
                        ),
                        NoteTextField(
                          value: widget.product.Note.replaceAll('\\n', '\n'),
                          myNode: noteNode,
                          nextNode: saveNode,
                          note: noteController,
                        ),
                        AddCountProduct(
                          add: () => addCount(),
                          nagative: () => negativeCount(),
                          num: count,
                          controller: controller,
                          commit: () => commitCount(),
                        ),
                        SaveBUTTON(
                          myNode: saveNode,
                          save: () => showMyDialogAddCart(
                            addProduct: ()=>addProductToBill(widget.product.Name, count, double.parse(widget.product.Price), widget.product.ID),
                              context: context,
                              urlImage: widget.product.UrlImage1,
                              name: widget.product.Name,
                              num: count,
                              price: double.parse(widget.product.Price)),
                          add: 'เพิ่มลงตะกร้า',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
