import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainButton extends StatefulWidget {

 // const MainButton({Key? key}) : super(key: key);
  String? title;
  VoidCallback? onPressed;
  MainButton({
    this.title,
    this.onPressed
  });
  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      height: 35.sp,
      minWidth:double.infinity,
      color: Theme.of(context).colorScheme.primary,
        onPressed: widget.onPressed,
        child: Text("${widget.title}",style:Theme.of(context).textTheme.button),

    );
  }
}
