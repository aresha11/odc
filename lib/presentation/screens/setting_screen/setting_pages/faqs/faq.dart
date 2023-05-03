import 'package:flutter/material.dart';

import '../../../../reusable_component/custom_appbar.dart';

class FAQ extends StatelessWidget {
  FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustumAppBar("FAQ")),
       body:Column(
         children: [
           const ExpansionTile(
             title: Text("Q1:How Many Countries Orange Digital Center is in"),
             children: [
               Text("16 Countries")
             ],

           ),
         ],

       ),
    );
  }
}
