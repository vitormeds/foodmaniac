

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmaniac/sale/model/infoProduct.dart';

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

  TextEditingController valueTextController;
  TextField valueText;

  @override
  Widget build(BuildContext context) {
    valueTextController = TextEditingController(text: character.qtd.toString());
    valueText = TextField(controller: valueTextController,keyboardType: TextInputType.number,);
    return Row(children: <Widget>[
      Container(
          margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
          alignment: Alignment.centerLeft,
          width: 40,
          child: RawMaterialButton(
            onPressed: actionMinusPressed,
            child: new Icon(
              Icons.minimize,
              color: Colors.white,
              size: 10.0,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.blue,
          )),
      Container(
        alignment: Alignment.center,
        width: 20,
        child: valueText,
      ),
      Container(
          margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
          alignment: Alignment.centerRight,
          width: 40,
          child: RawMaterialButton(
            onPressed: actionPlusPressed,
            child: new Icon(
              Icons.add,
              color: Colors.white,
              size: 10.0,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.blue,
          ))
    ]);
  }

  void actionMinusPressed() {
    setState(() {
      if(character.qtd > 0) {
        character.qtd = character.qtd - 1;
        valueText.controller.text = character.qtd.toString();
        minusPressed(character);
      }
    });
  }

  void actionPlusPressed() {
    setState(() {
      character.qtd = character.qtd + 1;
      valueText.controller.text = character.qtd.toString();
      plusPressed(character);
    });
  }
}
