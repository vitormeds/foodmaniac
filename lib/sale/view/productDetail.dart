
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmaniac/components/textView.dart';
import 'package:foodmaniac/sale/model/infoProduct.dart';
import 'package:foodmaniac/sale/view/addComponent.dart';
import 'package:foodmaniac/utils/constants.dart';

class ProductDetailWidget extends StatefulWidget {
  @override
  _ProductDetailWidgetState createState() => _ProductDetailWidgetState(this.product);

  ProductDetailWidget(this.product);
  InfoProduct product;
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  InfoProduct product;
  final obsController = TextEditingController();
  AddComponent addComponent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  _ProductDetailWidgetState(this.product);

  @override
  Widget build(BuildContext context) {

    void minusPressed(InfoProduct character) {

    }

    void plusPressed(InfoProduct character) {

    }

    return Scaffold(
      appBar: AppBar(title: Text("Cart"),),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Container(
              child: CachedNetworkImage (
                placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl: baseImageUrl + product.product.image,
                alignment: Alignment.centerLeft,
              )),
          Container(margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Text(product.product.name, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
          Container(margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Text(product.product.description, style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal))),
          TextView(obsController,'Observações')
        ],
      ),
        bottomNavigationBar: Container(
          color: Colors.blue,
          height: 60,
          child: Row(
            children: <Widget>[
              Container(margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: AddComponent(product,minusPressed,plusPressed)),
              Expanded(
                child: Container(),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: RaisedButton(
                  child: Text(
                    'Adicionar',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {

                  },
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
    );
  }
}
