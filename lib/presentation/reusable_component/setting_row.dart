import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainRow extends StatelessWidget {
  MainRow({Key? key,required this.title,required  this.onpress,required this.screen}) : super(key: key);
String title;
@required Function onpress;

@required Widget screen;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => screen,)),
      child: Card(

        child:  Row(
            children: [
              SizedBox(width: 3.w,),
              Expanded(child: Text("$title",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: 20.sp),)),
              IconButton(onPressed:()=>onpress(), icon: Icon(Icons.arrow_forward_ios_outlined)),
            ],
          )
      ),
    );
  }
}
