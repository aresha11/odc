import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


import '../../../constans/constatntsmethod.dart';
import '../../../constans/end_points.dart';

import '../../../data/remote/dio_helper.dart';
import '../../../model/autorization/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool visiblePassword = false;

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(PasswordVisibilityState());
  }

  void postLogin({
    required String email,
    required String password,
    context,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: loginEndPoint, data: {
      'email': email,
      'password': password,
    }).then((value) {
      if (value.statusCode == 200) {

        emit(LoginSuccessState(loginModel: LoginModel.fromJson(value.data)));
        flutterToast(
          msg: 'Loged in Successfully',
          color: Colors.green,
        );
      }
    }).catchError((error) {
      flutterToast(
        msg: 'Email or Password is Wrong',
        color: Colors.red,
      );
      if (kDebugMode) {
        print(error);
      }
      emit(LoginErrorState());
    });
  }










}
