import 'dart:async';

import 'Widget/MenuNavigator.dart';

// import './Backend/AddProduct.dart';
import 'package:flutter/material.dart';
import './Widget/NewProductWidget.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import './Backend/ProductModule.dart';
class DetailProduct extends StatefulWidget {
  final Product product;
  DetailProduct({this.product});

  @override
  State<StatefulWidget> createState() {
    return NewProductState();
  }
}

class NewProductState extends State<DetailProduct> {

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

  BehaviorSubject streamController;

  _selectDate(BuildContext context,FocusNode nextNode) async {
    selectDate = await showDatePicker(
      context: context,
      initialDate: startDate, // Refer step 1
      firstDate: DateTime(startDate.year - 5),
      lastDate: DateTime(startDate.year + 5),
    );
    if(selectDate != null){
      nextNode.requestFocus();
    }
    setState(() {});
  }

  Future<void> addImage() async {

  }

  @override
  void initState() {
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
    streamController.close();
    print('steam complete !');
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
              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01,0,MediaQuery.of(context).size.width*0.01,0),
              color: Color.fromRGBO(42, 64, 87, 5),
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                children: [BackButton(color: Colors.white,), AddProductText()],
              ),
            ),
            Flexible(
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("res/BackgroundShop.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                ListView(
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
                        child:Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LargeImageBox(
                                content: Image.network(widget.product.UrlImage1,)),
                            SpaceWidth(),
                            TwoImageBox(
                                contact: Image.network(widget.product.UrlImage1,)),
                            SpaceWidth(),
                            TwoImageBox(
                                contact: Image.network(widget.product.UrlImage1,)),
                          ],
                        )
                    ),
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
                            enable: true,
                            value: widget.product.Name,
                            myNode: nameNode,
                            nextNode: priceNode,
                            name: nameController,
                          ),
                          PriceTextField(
                            enable: true,
                            value: widget.product.Price,
                            myNode: priceNode,
                            nextNode: weightNode,
                            price: priceController,
                          ),
                          WeightTextField(
                            enable: true,
                            value: widget.product.Weight,
                            myNode: weightNode,
                            nextNode: widthNode,
                            weight: weightController,
                          ),
                          SpaceText(),
                          SizePacketText(),
                          SpaceText(),
                          SizePacketTextField(
                            enable: true,
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
                              dateselect: () => _selectDate(context,storageNode),
                              dateshow: widget.product.DateStart),
                          PlaceTextField(
                            value: widget.product.Storage,
                            myNode: storageNode,
                            nextNode: recommendNode,
                            storage: storageController,
                          ),
                          RecommendTextField(
                            value: widget.product.Recommend.replaceAll('\\n', '\n'),
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
                          SaveBUTTON(myNode: saveNode,)
                        ],
                      ),
                    ),
                  ],
                ),
              ]),)
          ],
        ),
      ),
    );
  }
}
