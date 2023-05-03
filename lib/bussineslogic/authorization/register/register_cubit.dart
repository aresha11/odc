import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constans/constatntsmethod.dart';
import '../../../constans/end_points.dart';
import '../../../data/remote/dio_helper.dart';


part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());



  Future postRegister({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String gender,
  }) async {
    emit(RegisterLoadingState());
    DioHelper.postData(url: registerEndPoint, data: {
      "email": email,
      "password": password,
      "name": name,
      "gender": gender,
      "phoneNumber": phoneNumber,
    }).then((value) {
      if (value.statusCode == 200) {
        print(value.statusCode);
        flutterToast(
          msg: 'Registered Successfully',
          color: Colors.green,

        );
        emit(RegisterSuccessState());
      }
    }).catchError((error){
      if (kDebugMode) {
        print(error);
      }
      emit(RegisterErrorState());
    });
  }
}
