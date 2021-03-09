import 'package:ApplicationRiceShopping/Admin/Backend/ProductModule.dart';
import 'package:flutter/material.dart';
import './Widget/StorageWidget.dart';
import './Backend/Product.dart';
import 'package:ApplicationRiceShopping/Admin/ChatMain.dart';
class StorageMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StorageStatus();
  }
}

class StorageStatus extends State<StorageMain> {
  ProductControl product = ProductControl();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavigationButton(
                BarIcon: Icon(Icons.book),
                BarText: 'แจ้งเตือน',
                GotoOther: () => {},
              ),
              NavigationButton(
                BarIcon: Icon(Icons.format_align_justify_outlined),
                BarText: 'คำสั่งซื้อ',
                GotoOther: () => {},
              ),
              NavigationButton(
                BarIcon: Icon(Icons.home),
                BarText: 'หน้าหลัก',
                GotoOther: () => {},
              ),
              NavigationButton(
                BarIcon: Icon(Icons.account_circle),
                BarText: 'ข้อมูลส่วนตัว',
                GotoOther: () => {},
              ),
              NavigationButton(
                BarIcon: Icon(Icons.chat),
                BarText: 'ข้อความ',
                GotoOther: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatMain()))},
              ),
            ],
          ),
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
                              List<Widget> list = [];
                              if (snaphost.hasData) {
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    list.clear();
                                    if (index % 2 == 0) {
                                      if (index < snaphost.data.length) {
                                        list.add(Flexible(
                                          child: ProductItem(
                                            name: snaphost.data[index].Name
                                                .toString(),
                                            price: snaphost.data[index].Price,
                                            num: snaphost.data[index].Num,
                                            imageUrl:
                                                snaphost.data[index].UrlImage1,
                                          ),
                                        ));
                                      }
                                      if (index + 1 < snaphost.data.length) {
                                        list.add(Flexible(
                                          child: ProductItem(
                                            name: snaphost.data[index + 1].Name,
                                            price:
                                                snaphost.data[index + 1].Price,
                                            num: snaphost.data[index + 1].Num,
                                            imageUrl: snaphost
                                                .data[index + 1].UrlImage1,
                                          ),
                                        ));
                                      } else {
                                        list.add(Flexible(child: Container()));
                                      }
                                    }
                                    return Row(
                                      children: list,
                                    );
                                  },
                                  itemCount: snaphost.data.length,
                                );
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
        floatingActionButton: Container(
          child: FloatingActionButton(
            onPressed: (){},
            child: AddButton(
            ),
            backgroundColor: Colors.red,
          ),
        )
        // Container(
        //   alignment: Alignment.bottomCenter,
        //   child: AddButton(
        //     GotoNewproduct: () => {},
        //   ),
        // ),
        );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final String price;
  final String num;
  final String imageUrl;

  const ProductItem({
    Key key,
    this.name,
    this.price,
    this.num,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.white24,
      onPressed: () => {},
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      height: MediaQuery.of(context).size.height * 0.35,
      minWidth: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.235,
            width: MediaQuery.of(context).size.width * 0.45,
            //color: Colors.yellow,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(imageUrl)),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8), topLeft: Radius.circular(8))),
            child: Container(),
          ),
          ProductCard(
            name: name,
            price: price,
            num: num,
            imageUrl: imageUrl,
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String num;
  final String imageUrl;

  const ProductCard({
    Key key,
    this.name,
    this.price,
    this.num,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8))),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.015,
            0, MediaQuery.of(context).size.width * 0.015, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
            color: Color.fromRGBO(32, 50, 50, 100)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SpaceHeight(),
            TextRiceName(
              NameText: name,
            ),
            TextPrice(
              FrontText: 'ราคา',
              MediumText: price,
              EndText: 'บาท',
            ),
            TextPrice(
              FrontText: 'เหลือ',
              MediumText: num,
              EndText: 'กระสอบ',
            ),
          ],
        ),
      ),
    );
  }
}
