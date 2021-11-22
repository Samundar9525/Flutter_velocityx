import 'package:ecom/main.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

import 'catlogmodel.dart';

class itemdetail extends StatelessWidget {

  final Item catalog;
  const itemdetail({Key? key,required this.catalog}) :
        assert(catalog!=null),super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyApp.creamcolor,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      backgroundColor: MyApp.creamcolor,
      body: SafeArea(
        child: Column(children: [
           Hero(
                tag:Key(catalog.id.toString()),
               child: Image.network(catalog.image),

           ).h40(context),
          Expanded(
              child:VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  width:context.screenWidth ,
                color: Colors.white,
                  child: Column(
                    children: [
                      catalog.title.text.xl4.bold.color(MyApp.bluecolor).make(),
                      catalog.description.text.xl.coolGray400.make(),
                      10.heightBox,
                    ],
                  ).py64(),
          ),
              )
          )
        ],
        ),
      ),
    );
  }
}
