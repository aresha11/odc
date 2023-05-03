import 'package:flutter/material.dart';

import '../../../../../constans/constatntsmethod.dart';
import '../../../../reusable_component/custom_appbar.dart';
import '../../../../widget/inputField.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  var emailController =TextEditingController();
  var nameController =TextEditingController();
  var supController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustumAppBar("Support")),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 18,),
              inputField(
                controller:nameController ,
                Validate: (String value) {
                  if (value.trim().isEmpty) {
                    return "InValid";
                  } else {
                    return null;
                  }
                },
                lable: ("Name"),
                preicon: Icons.person,
              ),
              SizedBox(height: 10,),
              inputField(
                controller: emailController,
                Validate: (String value) {
                  if (value.trim().isEmpty) {
                    return "InValid";
                  } else {
                    return null;
                  }
                },
                lable: ("Email"),
                preicon: Icons.email,
              ),
              SizedBox(height: 10,),
              inputField(
                controller: supController,
                preicon: null,
                Validate: (String value) {
                  if (value.trim().isEmpty) {
                    return "InValid";
                  } else {
                    return null;
                  }
                },
                lable: ("Description"),
                maxlines: 8,
              ),

              ElevatedButton(
                  onPressed: (){
                    flutterToast(msg: "Thanks For Your Support",color: Colors.green);
                    emailController.text="";
                    nameController.text="";
                    supController.text="";
                    setState(() {

                    });
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}