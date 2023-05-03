import 'package:flutter/material.dart';
import 'package:orangedegitalcenter/presentation/style/appcolor.dart';
import 'package:sizer/sizer.dart';

class CustumAppBar extends StatelessWidget {
  /// Parameters
  final String title;
  Color? text_color;
   CustumAppBar(this.title,{Key? key,this.text_color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(title,style:TextStyle(color:Theme.of(context).colorScheme.onPrimary,fontSize: 22.sp ),),
    );
  }
}
