

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmaniac/sale/model/infoProduct.dart';
import 'package:foodmaniac/utils/constants.dart';

class AddComponent extends StatefulWidget {
  @override
  _AddComponentWidgetState createState() => _AddComponentWidgetState(this.character, this.minusPressed, this.plusPressed);

  AddComponent(this.character, this.minusPressed, this.plusPressed);
  Function(InfoProduct character)  minusPressed;
  Function(InfoProduct character)  plusPressed;
  InfoProduct character;
}

class _AddComponentWidgetState extends State<AddComponent> {
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

  _AddComponentWidgetState(this.character, this.minusPressed, this.plusPressed);

  Function(InfoProduct character)  minusPressed;
  Function(InfoProduct character)  plusPressed;
  InfoProduct character;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
          margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
          alignment: Alignment.centerLeft,
          width: 40,
          child: RawMaterialButton(
            onPressed: actionMinusPressed,
            child:  Text(
              '-',
              style: TextStyle(color: primaryColor, fontSize: 30),
            ),
            fillColor: secondaryColor,
          )),
      Container(
        alignment: Alignment.center,
        child: Text(character.qtd.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: secondaryColor, fontSize: 16),
          maxLines: 1,),
      ),
      Container(
          margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
          alignment: Alignment.centerRight,
          width: 40,
          child: RawMaterialButton(
            onPressed: actionPlusPressed,
            child:  Text(
              '+',
              style: TextStyle(color: primaryColor, fontSize: 30),
            ),
            fillColor: secondaryColor,
          ))
    ]);
  }

  void actionMinusPressed() {
    setState(() {
      if(character.qtd > 1) {
        character.qtd = character.qtd - 1;
        minusPressed(character);
      }
    });
  }

  void actionPlusPressed() {
    setState(() {
      character.qtd = character.qtd + 1;
      plusPressed(character);
    });
  }
}
