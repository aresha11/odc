import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orangedegitalcenter/presentation/widget/inputField.dart';
import 'package:orangedegitalcenter/presentation/widget/mainButton.dart';

import '../../../../bussineslogic/authorization/register/register_cubit.dart';
import '../../../../constans/function.dart';
import '../../../reusable_component/custom_appbar.dart';
import '../../../widget/rich_text.dart';
import '../../bottom_navigation_bar/home_screen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Functions functions = Functions();

  /// Controller
  var name_controller = TextEditingController();
  var mail_controller = TextEditingController();
  var password_controller = TextEditingController();
  var repassword_controller = TextEditingController();
  var phone_controller = TextEditingController();

  /// keys
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  /// constants
  var items = ["Male", "Female", "Gender"];

  var genItem = "Gender";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context,state){
          if(state is RegisterSuccessState){
          //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home(),), (route) => false);
            functions.Navigate(context: context, pushtype: "pushReplacement", nextscreen: Home());
          }
            },
        builder: (context, state) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustumAppBar("Register")),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Richtext(),
                  const SizedBox(
                    height: 80,
                  ),
                  inputField(
                    Validate: (String Value) {
                      if (Value.trim().isEmpty) {
                        return 'inValid';
                      } else {
                        return null;
                      }
                    },
                    keynoardtype: TextInputType.text,
                    lable: ("Name"),
                    controller: name_controller,
                    preicon: Icons.person,
                    maxlines: 1,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  inputField(
                    Validate: (String Value) {
                      if (Value.trim().isEmpty) {
                        return 'inValid';
                      } else {
                        return null;
                      }
                    },
                    keynoardtype: TextInputType.emailAddress,
                    lable: ("Email"),
                    controller: mail_controller,
                    preicon: Icons.email,
                    maxlines: 1,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  inputField(
                    Validate: (String Value) {
                      if (Value.trim().isEmpty) {
                        return 'inValid';
                      } else {
                        return null;
                      }
                    },
                    keynoardtype: TextInputType.number,
                    lable: ("Password"),
                    controller: password_controller,
                    preicon: Icons.lock,
                    secur: true,
                    suficon: Icons.remove_red_eye,
                    maxlines: 1,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  inputField(
                    Validate: (String Value) {
                      if (Value.trim().isEmpty ||
                          Value != repassword_controller.text) {
                        return 'inValid';
                      } else {
                        return null;
                      }
                    },
                    keynoardtype: TextInputType.number,
                    lable: ("Re Password"),
                    suficon: Icons.remove_red_eye,
                    preicon: Icons.lock,
                    controller: repassword_controller,
                    secur: true,
                    maxlines: 1,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  inputField(
                    Validate: (String Value) {
                      if (Value.trim().isEmpty) {
                        return 'inValid';
                      } else {
                        return null;
                      }
                    },
                    keynoardtype: TextInputType.phone,
                    lable: ("Phone Number"),
                    controller: phone_controller,
                    preicon: Icons.phone,
                    maxlines: 1,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: SizedBox(),
                      ),

                      const Expanded(
                        child: SizedBox(),
                      ),
                      DropdownButton(
                          value: genItem,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              genItem = newValue!;
                            });
                          }),
                      const Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                  MainButton(
                    title: ("Register"),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<RegisterCubit>().postRegister(
                            name: name_controller.text,
                            email: mail_controller.text,
                            password: password_controller.text,
                            gender: "m",
                            phoneNumber: phone_controller.text,
                        );
                        functions.turnNavigate(context: context,
                            nextscreen: Home(),
                            pushtype: "remove");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
