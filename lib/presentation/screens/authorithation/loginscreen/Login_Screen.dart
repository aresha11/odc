import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orangedegitalcenter/bussineslogic/authorization/login/login_cubit.dart';
import 'package:orangedegitalcenter/presentation/screens/bottom_navigation_bar/home_screen.dart';
import 'package:orangedegitalcenter/presentation/reusable_component/custom_appbar.dart';
import 'package:orangedegitalcenter/presentation/widget/inputField.dart';
import 'package:orangedegitalcenter/presentation/widget/mainButton.dart';

import '../../../../constans/function.dart';
import '../../../../data/local/shared_preference/shared_preference.dart';
import '../../../widget/rich_text.dart';
import '../registerscreen/Register_Screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Functions functions=Functions();
    /// Controllers
  var email_controller=TextEditingController();
  var pass_controller=TextEditingController();
  CacheHelper cacheHelper=CacheHelper();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context,state){
        if(state is LoginSuccessState){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
          functions.turnNavigate(context: context, pushtype: "remove", nextscreen: Home());
        }
      },
      builder: (context,state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: CustumAppBar("Login")),
          body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              color: Colors.grey[100],
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Richtext(),
                      const SizedBox(height: 60,),
                      inputField(
                        maxlines: 1,
                        Validate: (String Value) {
                          if (Value
                              .trim()
                              .isEmpty) {
                            return 'inValid';
                          } else {
                            return null;
                          }
                        },
                        lable: ("Email"),
                        preicon: Icons.email,
                        controller: email_controller,
                      ),
                      const SizedBox(height: 20,),
                      inputField(
                        maxlines: 1,
                        Validate: (String Value) {
                          if (Value
                              .trim()
                              .isEmpty) {
                            return 'inValid';
                          } else {
                            return null;
                          }
                        },
                        lable: ("Password"),
                        preicon: Icons.lock,
                        suficon: Icons.remove_red_eye,
                        controller: pass_controller,
                        secur: true,
                      ),
                      const SizedBox(height: 20,),
                      MainButton(
                        title: "LOG IN",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginCubit>().postLogin(email: email_controller.text, password: pass_controller.text);
                            CacheHelper.put(key:"logged ",value: "true" );
                          }
                        },
                      ),
                      const SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Expanded(child: Divider(thickness: 2,),),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("OR"),
                          ),

                          Expanded(child: Divider(thickness: 2,)),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      MainButton(
                        title: "REGISTER",
                        onPressed: () {
                          functions.turnNavigate(context: context, pushtype: "push", nextscreen: Register());
                        },
                      )
                    ],
                  ),
                ),
              )
          ),
        );
      });

  }
}
