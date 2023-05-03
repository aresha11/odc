import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orangedegitalcenter/bussineslogic/notes_logic/bottomsheet/BottomCubit.dart';
import 'package:orangedegitalcenter/bussineslogic/notes_logic/bottomsheet/Bottomstate.dart';
import 'package:orangedegitalcenter/presentation/screens/home_screen/home_pages/notes_page/update%20_notes.dart';
import 'package:sizer/sizer.dart';

import '../../../constans/function.dart';

class NoteRow extends StatelessWidget {
  // DataBase d=DataBase();
Functions functions=Functions();
  Map data;
  NoteRow(this.data);

  @override
  Widget build(BuildContext context) {
    //var time =TimeOfDay.now().format(context).toString();
    return BlocConsumer<BottomSheetCubit, BottomSheetState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
               Text(data["time"],style: TextStyle(fontSize: 17.sp),),
               SizedBox(width: 12.w,),
               Text(data["date"],style: TextStyle(fontSize: 17.sp)),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(data["title"],
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.secondary))),
                    IconButton(
                        onPressed: () {
                          context.read<BottomSheetCubit>().deleteDB(id: data["id"]);
                        },
                        icon: Icon(Icons.delete)),
                    IconButton(
                        onPressed: () {

                          functions.waveNavigate(pushtype: "push",context: context, nextscreen: UpdateNotes(id: data,),);

                        },
                        icon: Icon(Icons.edit)),
                  ],
                ),
              ),
              //Text(m["title"]),
              Text("${data["description"]}",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary)),

              SizedBox(
                height: 12,
              )
            ],
          ),
        );
      },
    );
  }
}
