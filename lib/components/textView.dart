import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmaniac/sale/model/infoProduct.dart';
import 'package:foodmaniac/sale/view/addComponent.dart';
import 'package:foodmaniac/utils/constants.dart';
import 'package:foodmaniac/utils/utils.dart';

class TextView extends StatefulWidget {
  @override
  _TextViewWidgetState createState() => _TextViewWidgetState(this.obsController,this.hintText);

  TextView(this.obsController,this.hintText);
  TextEditingController obsController;
  String hintText;
}

class _TextViewWidgetState extends State<TextView> {
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

  _TextViewWidgetState(this.obsController,this.hintText);
  TextEditingController obsController;
  String hintText;

  @override
  Widget build(BuildContext context) {

    return Container(margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
        constraints: BoxConstraints(minHeight: 100),
        decoration: Utils.cornerBorder(1.0, 5.0, Colors.grey),
        child: Container(margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: obsController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText
              )
          ),));
  }
}
