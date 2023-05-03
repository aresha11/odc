import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orangedegitalcenter/bussineslogic/notes_logic/bottomsheet/BottomCubit.dart';
import 'package:orangedegitalcenter/bussineslogic/notes_logic/bottomsheet/Bottomstate.dart';
import 'package:sizer/sizer.dart';

import 'note_row.dart';

class NotesBody extends StatelessWidget {
   NotesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomSheetCubit,BottomSheetState>(
      listener: (context,state){},
        builder: (context,state){
        if(context.read<BottomSheetCubit>().Notes.isEmpty){
          return Center(
            child: Text("There Are No Notes Yet",style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w600,),),
          );
        }else {
          return ListView.builder(
            itemCount: context
                .read<BottomSheetCubit>()
                .Notes
                .length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  NoteRow(context
                      .read<BottomSheetCubit>()
                      .Notes[index]),
                  SizedBox(height: 2.5.h,)
                ],
              );
            },

          );
        }}
    );
  }
}
