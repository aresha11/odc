import 'package:flutter/material.dart';
import 'package:orangedegitalcenter/presentation/style/appcolor.dart';
import 'package:sizer/sizer.dart';

class maincontainer extends StatelessWidget {
  ///parameters
  String title;
  Icon icon;
  VoidCallback? ontap;
   maincontainer({required this.title,required this.icon,this.ontap}) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: ontap,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child:icon ,
                  radius: 22.sp,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //   child: icon,
                //  child: Icon(Icons.account_circle)
              //  ),
                Text(title,style: TextStyle(fontSize: 20.sp,color:Theme.of(context).colorScheme.primary),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

