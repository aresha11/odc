import 'package:flutter/material.dart';

import '../../../../../model/midter_model/midtemt_model.dart';
import '../../../../reusable_component/custom_appbar.dart';
import '../../../../reusable_component/midterm_items.dart';


class MidTermsScreen extends StatelessWidget {
  MidTermsScreen({Key? key}) : super(key: key);
  List<MidTermItemModel> midTermItemModelDataList = [
    MidTermItemModel(
        title: 'Flutter',
        duration: '2hrs',
        endTime: '2:00pm',
        examDate: '2022-08-18',
        startTime: '12:00pm'),
    MidTermItemModel(
        title: 'React',
        duration: '2hrs',
        endTime: '2:00pm',
        examDate: '2022-08-18',
        startTime: '12:00pm'),
    MidTermItemModel(
        title: 'Vue',
        duration: '2hrs',
        endTime: '2:00pm',
        examDate: '2022-08-18',
        startTime: '12:00pm'),
    MidTermItemModel(
        title: 'Flutter',
        duration: '2hrs',
        endTime: '2:00pm',
        examDate: '2022-08-18',
        startTime: '12:00pm'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustumAppBar("Midterms")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 10,),
          itemCount: midTermItemModelDataList.length,
          itemBuilder: (context, index) => CustomMidTermItem(
              midTermItemModel: midTermItemModelDataList[index]),
        ),
      ),
    );
  }
}
