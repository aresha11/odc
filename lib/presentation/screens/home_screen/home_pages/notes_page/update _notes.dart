import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orangedegitalcenter/bussineslogic/notes_logic/bottomsheet/Bottomstate.dart';

import '../../../../../bussineslogic/notes_logic/bottomsheet/BottomCubit.dart';
import '../../../../reusable_component/custom_appbar.dart';
import '../../../../style/appcolor.dart';
import '../../../../widget/inputField.dart';

class UpdateNotes extends StatelessWidget {
   UpdateNotes({Key? key,required this.id,}) : super(key: key);
  var scafoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  Map id;

  //bool isshown = false;
  var edit_title_controller = TextEditingController();
  var edit_description_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomSheetCubit,BottomSheetState>(

      listener: (context,state){},
      builder: (context, state) =>

      Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: CustumAppBar("Update Note")),
        body: Form(
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
                 // controller: edit_title_controller.text=context.read<BottomSheetCubit>().data[id]["title"],
                  controller: edit_title_controller,
                // initialvalue: context.read<BottomSheetCubit>().data[id]["title"],
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
                // controller: edit_description_controller.text=context.read<BottomSheetCubit>().Notes[id["id"]]["description"],
                  controller: edit_description_controller,
                 // initialvalue: context.read<BottomSheetCubit>().Notes[id["id"]-1]["description"],
                  Validate: (String value) {
                    if (value.trim().isEmpty) {
                      return "InValid";
                    } else {
                      return null;
                    }
                  },
                 // hint: ('${context.read<BottomSheetCubit>().data[id["id"]]["description"]}'),
                  lable: ("Description"),
                  maxlines: 8,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(AppColor.primarycolor)),
                    onPressed: () {
                      if(formkey.currentState!.validate()){
                        context.read<BottomSheetCubit>().upDB(
                            title: edit_title_controller.text,
                            description: edit_description_controller.text,
                            id: id["id"]);
                        Navigator.pop(context);
                        // print(id["id"]);
                        // print(context.read<BottomSheetCubit>().Notes[id["id"]-1]["description"]);
                      }

                    },
                    child: Text("Update"))
              ],
            ),
          ),
        )
      ),
    );
   
  }
}
