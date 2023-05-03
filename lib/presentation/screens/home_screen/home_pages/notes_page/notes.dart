import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:orangedegitalcenter/bussineslogic/notes_logic/bottomsheet/BottomCubit.dart';
import 'package:orangedegitalcenter/bussineslogic/notes_logic/bottomsheet/Bottomstate.dart';
import 'package:orangedegitalcenter/presentation/reusable_component/bages_appbar.dart';
import 'package:orangedegitalcenter/presentation/style/appcolor.dart';

import '../../../../reusable_component/custom_appbar.dart';
import '../../../../widget/inputField.dart';
import '../../../../widget/notes_body/notes_body.dart';

class Notes extends StatelessWidget {
  Notes({Key? key}) : super(key: key);
  var scafoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();

  //bool isshown = false;
  var title_controller = TextEditingController();
  var description_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomSheetCubit, BottomSheetState>(
        listener: (context, state) {
          if (state is appinsertdatabasestate){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            key: scafoldkey,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: CustumAppBar("Notes")),
            body: NotesBody(),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.primarycolor,
              onPressed: () {
                if (context.read<BottomSheetCubit>().isbottomsheetshown) {
                  if (formkey.currentState!.validate()) {

                    context.read<BottomSheetCubit>().insertData(
                        title: title_controller.text,
                        description: description_controller.text,
                      time: TimeOfDay.now().format(context).toString(),
                      date:DateFormat.yMMMd().format(DateTime.now()),

                    ).then((value) {
                      context.read<BottomSheetCubit>().changebottomsheetstate(
                          isshown: false, icon: Icons.edit);

                    });

                  }
                } else {
                  context.read<BottomSheetCubit>().createTable();
                  scafoldkey.currentState!
                      .showBottomSheet(
                          constraints:
                              BoxConstraints(minHeight: double.infinity),
                          (context) => Form(
                                key: formkey,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Add Note",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      inputField(
                                        controller: title_controller,
                                        Validate: (String value) {
                                          if (value.trim().isEmpty) {
                                            return "InValid";
                                          } else {
                                            return null;
                                          }
                                        },
                                        lable: ("Title"),
                                        preicon: Icons.title,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      inputField(
                                        controller: description_controller,
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
                                      SizedBox(
                                        height: 30,
                                      ),

                                    ],
                                  ),
                                ),
                              ))
                      .closed
                      .then((value) {
                    context.read<BottomSheetCubit>().changebottomsheetstate(
                        isshown: false, icon: Icons.edit);
                    // isshown = false;
                    // //
                    // icon = Icons.edit;
                  });
                  context
                      .read<BottomSheetCubit>()
                      .changebottomsheetstate(isshown: true, icon: Icons.add);
                  // isshown = true;
                }
              },
              child: Icon(context.read<BottomSheetCubit>().fabicon),
              //Text("+",style: TextStyle(fontSize: 18),),
            ),
          );
        });
  }
}
