// ignore_for_file: must_be_immutable

import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter/material.dart';
import 'package:orangedegitalcenter/data/local/shared_preference/shared_preference.dart';
import 'package:orangedegitalcenter/presentation/screens/authorithation/loginscreen/Login_Screen.dart';
import 'package:orangedegitalcenter/presentation/screens/setting_screen/setting_pages/faqs/faq.dart';
import 'package:orangedegitalcenter/presentation/reusable_component/setting_row.dart';
import 'package:orangedegitalcenter/presentation/screens/setting_screen/setting_pages/ourpartners/ourprtners.dart';
import 'package:orangedegitalcenter/presentation/screens/setting_screen/setting_pages/support/support.dart';
import 'package:orangedegitalcenter/presentation/screens/setting_screen/setting_pages/terms&conditions/termsconditions.dart';
import 'package:orangedegitalcenter/presentation/screens/splashscreen/Splash_Screen.dart';
import 'package:sizer/sizer.dart';

import '../../../constans/function.dart';

// ignore: camel_case_types
class setting_content extends StatelessWidget {
  setting_content({Key? key}) : super(key: key);
  Functions functions = Functions();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            MainRow(
              screen: FAQ(),
              //ontap: ,
              title: "FAQ",
              onpress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FAQ(),
                    ));
              },
            ),
            const SizedBox(
              height: 8,
            ),
            MainRow(
              screen: const TermsAndConditions(),
              title: "Terms & Conditions",
              onpress: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            MainRow(
              screen: const PartnerScreen(),
              title: "Our Partners",
              onpress: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            MainRow(
              screen: const Support(),
              title: "Support",
              onpress: () {},
            ),
            const SizedBox(
              height: 8,
            ),




             InkWell(
            onTap: (){
              showAnimatedDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return ClassicGeneralDialogWidget(
                    titleText: 'Logout',
                    contentText: 'Are You Sure',
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                color:
                                Theme.of(context).colorScheme.primary),
                          )),
                      TextButton(
                          onPressed: () {
                            functions.Navigate(
                                context: context,
                                nextscreen: Splash(),
                                pushtype: "remove");
                            CacheHelper.clearData();
                          },
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                color:
                                Theme.of(context).colorScheme.primary),
                          ))
                    ],

                  );
                },
                animationType: DialogTransitionType.size,
                curve: Curves.fastOutSlowIn,
                duration: const Duration(seconds: 1),
              );
             },
             child: Card(

              child:  Row(
                children: [
                  SizedBox(width: 3.w,),
                  Expanded(child: Text("Logout",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: 20.sp),)),
                  IconButton(onPressed:(){

                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return ClassicGeneralDialogWidget(
                          titleText: 'Logout',
                          contentText: 'Are You Sure',
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.sp,
                                      color:
                                      Theme.of(context).colorScheme.primary),
                                )),
                            TextButton(
                                onPressed: () {
                                  functions.Navigate(
                                      context: context,
                                      nextscreen: Splash(),
                                      pushtype: "remove");
                                  CacheHelper.put(key: "logged",value: "false");
                                },
                                child: Text(
                                  "Confirm",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.sp,
                                      color:
                                      Theme.of(context).colorScheme.primary),
                                ))
                          ],

                        );
                      },
                      animationType: DialogTransitionType.size,
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(seconds: 1),
                    );
                  },
                      icon: Icon(Icons.arrow_forward_ios_outlined)),
                ],
              )
          ),
        )



          ],
        ),
      ),
    );
  }
}
