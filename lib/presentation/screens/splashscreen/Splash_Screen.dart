import 'package:flutter/material.dart';
import 'package:orangedegitalcenter/data/local/shared_preference/shared_preference.dart';
import 'package:orangedegitalcenter/presentation/screens/authorithation/loginscreen/Login_Screen.dart';
import 'package:orangedegitalcenter/presentation/screens/bottom_navigation_bar/home_screen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';



class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Image.asset(
            "assets/splash-image.png",
            height: MediaQuery.of(context).size.height / 11,
            width: MediaQuery.of(context).size.width / 1.5,
            fit: BoxFit.cover,
          ),

          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LinearPercentIndicator(
              animation: true,
              lineHeight: 7.0,
              animationDuration: 2500,
              percent: 1,
              barRadius: const Radius.circular(50),
              progressColor: Colors.deepOrange,
              onAnimationEnd: () {
    if(CacheHelper.get(key: "logged")=="true"){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home(),), (route) => false);
    }else{
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false);

    }

       }
       ))
        ],
      ),
    );
  }
}
