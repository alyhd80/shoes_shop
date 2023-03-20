import 'package:flutter/material.dart';


class ShoesSizeItem extends StatelessWidget {
  final String text;
  const ShoesSizeItem({Key? key, required this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(5),
    child: Text("US $text",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11),),);
  }
}
