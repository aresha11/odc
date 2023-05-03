import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orangedegitalcenter/bussineslogic/authorization/login/login_cubit.dart';
import 'package:orangedegitalcenter/presentation/screens/authorithation/loginscreen/Login_Screen.dart';
import 'package:orangedegitalcenter/presentation/screens/authorithation/registerscreen/Register_Screen.dart';
import 'package:orangedegitalcenter/presentation/screens/bottom_navigation_bar/home_screen.dart';
import 'package:orangedegitalcenter/presentation/screens/home_screen/home_pages/notes_page/notes.dart';
import 'package:orangedegitalcenter/presentation/screens/splashscreen/Splash_Screen.dart';
import 'package:sizer/sizer.dart';

import 'bussineslogic/authorization/register/register_cubit.dart';
import 'bussineslogic/notes_logic/bottomsheet/BottomCubit.dart';
import 'data/local/shared_preference/shared_preference.dart';
import 'data/remote/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context,Orientation orientation,DeviceType devicetype) {
        return  MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider(
              create: (context) => LoginCubit(),
            ),
            BlocProvider(
              create: (context) => BottomSheetCubit()..createTable(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Sizer",
            theme: ThemeData(
              iconTheme:IconThemeData(
                color: Colors.deepOrange,
                size: 20.sp
              ) ,

             // brightness: Brightness.dark,

              colorScheme: const ColorScheme(
                error: Colors.red,
                onPrimary: Colors.black,
                primary: Colors.deepOrange,


                secondary: Colors.deepOrange,
                background: Colors.white,
                brightness:Brightness.light,
                onSecondary:Colors.white,
                onError: Colors.white,
                surface: Colors.white,
                onSurface: Colors.deepOrange,
                onBackground: Colors.white,
               
              ),
              textTheme: const TextTheme(
                ///appbar
                headline1: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),



              ),

            ),
            home: Splash(),

          ),
        );

      });
  }
}











