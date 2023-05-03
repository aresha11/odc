import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class inputField extends StatefulWidget {
  int temp = 0;
  String? lable;
  String? hint;
  IconData? preicon;
  IconData? suficon;
  bool secur;
  @required
  Function Validate;
  TextEditingController? controller;
  VoidCallback? ontap;
  bool readonly;
  int? maxlines;
  var keynoardtype;
  String? initialvalue;

  inputField(
      {this.readonly = false,
      this.lable,
      this.hint,
      this.preicon,
      this.suficon,
      this.secur = false,
      this.controller,
      required this.Validate,
      this.ontap,
      this.keynoardtype,
      this.maxlines,
      this.initialvalue});

  @override
  State<inputField> createState() => _inputFieldState();
}

class _inputFieldState extends State<inputField> {
  bool hidepassword = true;
  var eyeicon = Icons.remove_red_eye;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
     // autofocus: false,
      initialValue: widget.initialvalue,
      maxLines: widget.maxlines,
      inputFormatters: <TextInputFormatter>[
        if (widget.keynoardtype == TextInputType.phone)
          FilteringTextInputFormatter.digitsOnly
      ],
      keyboardType: widget.keynoardtype,
      readOnly: widget.readonly,
      onTap: widget.ontap,
      validator: (p) => widget.Validate(p),
      controller: widget.controller,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 100.sp),
          borderRadius: BorderRadius.circular(12),
        ),
        labelText: widget.lable,
        alignLabelWithHint: true,
        labelStyle: TextStyle(),
        hintText: widget.hint,
        prefixIcon: Icon(widget.preicon,color: Theme.of(context).colorScheme.primary,),
        //   suffixIcon:IconButtonn(,widget.suficon),
        suffixIcon: widget.secur
            ? IconButton(
                onPressed: () {
                  setState(() {
                    hidepassword = !hidepassword;
                    eyeicon = hidepassword
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined;
                  });
                },
                icon: Icon(eyeicon),
              )
            : null,
      ),
      obscureText: widget.secur && hidepassword,
    );
  }
}
