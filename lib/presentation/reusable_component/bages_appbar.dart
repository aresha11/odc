import 'package:flutter/material.dart';

class PagesAppBar extends StatelessWidget {
  /// Parameters

  PagesAppBar({this.title=""}) : super();
  String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: (){
        Navigator.pop(context);
      },
          icon: Icon(Icons.arrow_back_rounded,color: Colors.black,)),

      title: Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
    );
  }
}
