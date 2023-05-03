import 'package:flutter/material.dart';
import 'package:orangedegitalcenter/presentation/reusable_component/bages_appbar.dart';

import '../../../../reusable_component/custom_appbar.dart';
class Finals extends StatelessWidget {
  const Finals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustumAppBar("Finals")),
      body: Center(
        child:Container(
          child: Text("Finals Page"),
        ),
      ),
    );
  }
}