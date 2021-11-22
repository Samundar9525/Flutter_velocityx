import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ecom/catlogmodel.dart';

import 'item_detail.dart';
import 'main.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    var jsondata = await rootBundle.loadString("asse/shopping.json");
    var decodedata = jsonDecode(jsondata);

    var product = decodedata["products"];
    catlog_model.items =
        List.from(product).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
    // print(catlog_model.items[0].title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyApp.creamcolor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              catlogheader(),
              if (catlog_model.items != null && catlog_model.items.isNotEmpty)
                Cataloglist().expand()
              else
                Center(child: CircularProgressIndicator())
              // Text("${catlog_model.items}"),
            ],
          ),
        ),
      ),
    );
  }
}

class catlogheader extends StatelessWidget {
  const catlogheader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Sadak Chaap Mall".text.xl5.bold.color(MyApp.bluecolor).make(),
        "Rasste ka Maal Saste mai".text.xl2.make(),
      ],
    );
  }
}

class Cataloglist extends StatelessWidget {
  const Cataloglist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: catlog_model.items.length,
        itemBuilder: (context, index) {
          final catalog = catlog_model.items[index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => itemdetail(
                            catalog: catalog,
                          ))),
              child: CatalogItem(catalog: catalog));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag:Key(catalog.id.toString()) ,
            child: catlogimage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.title.text.lg.bold.color(MyApp.bluecolor).make(),
            catalog.description.text.xs.coolGray400.make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH8,
              children: [
                "${(catalog.price) * 70} ₹".text.make(),
                ElevatedButton(onPressed: () {}, child: "Buy".text.make())
              ],
            )
          ],
        ))
      ],
    )).white.roundedLg.square(150).make().py12();
  }
}

class catlogimage extends StatelessWidget {
  final String image;
  const catlogimage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p16
        .color(MyApp.creamcolor)
        .make()
        .p16()
        .w32(context);
  }
}
