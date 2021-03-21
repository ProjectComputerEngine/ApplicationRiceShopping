import 'package:ApplicationRiceShopping/Admin/Backend/ProductModule.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Widget/StorageWidget.dart';
import './Backend/Product.dart';
import 'package:ApplicationRiceShopping/Admin/InboxMain.dart';
// import 'NewProductMain.dart';
import 'DetailProduct.dart';
import 'Widget/MenuNavigator.dart';
class StorageMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StorageStatus();
  }
}

class StorageStatus extends State<StorageMain> {
  ProductControl product = ProductControl();
  List<Widget> list = [];
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          color: Colors.white,
          child: menu(),
        ),
        body: Container(
          margin: MediaQuery.of(context).padding,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                color: Color.fromRGBO(32, 50, 50, 10),
                child: Row(
                  children: [
                    BackIcons(
                      GotoBackPage: () => {},
                    ),
                    ProductText(),
                  ],
                ),
              ),

              //---------------//
              Flexible(
                child: Container(
                    color: Color.fromRGBO(32, 50, 50, 10),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        SpaceDisplay(),
                        Container(
                          // margin: EdgeInsets.zero,
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.04,
                              0,
                              MediaQuery.of(context).size.width * 0.04,
                              0),
                          //color: Colors.red,
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: FutureBuilder(
                            future: product.productAll(context),
                            builder: (context, snaphost) {

                              if (snaphost.hasData) {
                                if(snaphost.connectionState == ConnectionState.done){

                                  print('Write Data done');
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index)  {
                                      list.clear();
                                      if (index % 2 == 0) {
                                        if (index < snaphost.data.length) {
                                          var _product1 = product.LoadProductModule(snaphost.data[index]);
                                          list.add(Flexible(
                                            child: ProductItem(
                                              goToDetail: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailProduct(
                                                              product: _product1,
                                                            )));
                                              },
                                              name: _product1.Name
                                                  .toString(),
                                              price: _product1.Price,
                                              num: _product1.Num,
                                              imageUrl: _product1.UrlImage1,
                                            ),
                                          ));
                                        }
                                        if (index + 1 < snaphost.data.length) {
                                          var _product2 = product.LoadProductModule(snaphost.data[index+1]);
                                          list.add(Flexible(
                                            child: ProductItem(
                                              goToDetail: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailProduct(
                                                              product: _product2,
                                                            )));
                                              },
                                              name:
                                                  _product2.Name,
                                              price: _product2.Price,
                                              num: _product2.Num,
                                              imageUrl: _product2.UrlImage1,
                                            ),
                                          ));
                                        } else {
                                          list.add(
                                              Flexible(child: Container()));
                                        }
                                      }
                                      return Row(
                                        children: list,
                                      );
                                    },
                                    itemCount: snaphost.data.length,
                                  );
                                }else{
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ), // This trailing comma makes aut
                          // ListView(
                          //   // mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     ProductItem(name: 'ข้าวหอมมะลิแต่งกลิ่นใบเตย\nคัดพิเศษ ',price: '115' ,num: '100' ,imageUrl:'http://192.168.43.19:8080/img/1.jpg' ,),
                          //     SpaceProduct(),
                          //   ],
                          // ),
                        ),
                        // SpaceDisplay(),
                        // SpaceDisplay(),
                      ],
                    )),
              )
            ],
          ),
        ),
        // Container(
        //   alignment: Alignment.bottomCenter,
        //   child: AddButton(
        //     GotoNewproduct: () => {},
        //   ),
        // ),
        );
  }
}
