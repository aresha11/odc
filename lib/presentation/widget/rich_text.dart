import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Richtext extends StatelessWidget {
  Richtext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
          text:  TextSpan(
              text: "Orange",
              style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w900,color:Theme.of(context).colorScheme.primary),
              children: <TextSpan>[
            TextSpan(
              text: ' Digital Center',
              style:TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700,color:Theme.of(context).colorScheme.onPrimary),
            ),
          ])),
    );
  }
}
