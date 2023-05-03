

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_route_animator/page_route_animator.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import 'package:wave_transition/wave_transition.dart';


class Functions{
  void Navigate({required context,required pushtype,required nextscreen}){
    if(pushtype=="remove"){
      Navigator.pushReplacement(
          context,
          PageRouteAnimator(
            child:  nextscreen,
            routeAnimation: RouteAnimation.bottomToTop,
            // currentChild: Splash(),
            //settings:  RouteSettings(arguments: 'I am going'),
            curve: Curves.slowMiddle,
            duration: const Duration(seconds: 2),
            reverseDuration: const Duration(seconds: 2),
          ) );
    }else if (pushtype=="push"){
      Navigator.push(
          context,
          PageRouteAnimator(
            child:  nextscreen,
            routeAnimation: RouteAnimation.bottomToTop,
            // currentChild: Splash(),
            //settings:  RouteSettings(arguments: 'I am going'),
            curve: Curves.slowMiddle,
            duration: const Duration(seconds: 2),
            reverseDuration: const Duration(seconds: 2),
          ) );
    }else if (pushtype=="replace"){
     Navigator.pushAndRemoveUntil(context,

         PageRouteAnimator(
           child:  nextscreen,
           routeAnimation: RouteAnimation.bottomToTop,
           //settings:  RouteSettings(arguments: 'I am going'),
           curve: Curves.slowMiddle,
           duration: const Duration(seconds: 2),
           reverseDuration: const Duration(seconds: 2),
         ),
             (route) => false
     );
    }
  }




   turnNavigate({required context,required nextscreen,required pushtype}){
    if(pushtype=="push"){
      Navigator.of(context).push(
          TurnPageRoute(
            overleafColor: Colors.grey,
            // turningPoint: turningPoint,
            transitionDuration: const Duration(seconds: 2),
            builder: (context) =>   nextscreen,
          ));
    }else if(pushtype=="replace"){
      Navigator.of(context).pushReplacement(
          TurnPageRoute(
            overleafColor: Colors.grey,
            // turningPoint: turningPoint,
            transitionDuration: const Duration(seconds: 2),
            builder: (context) =>   nextscreen,
          ));
    }else if(pushtype=="remove"){
      Navigator.pushAndRemoveUntil(
          context, TurnPageRoute(
        overleafColor: Colors.grey,
        transitionDuration: const Duration(seconds: 2),
        builder: (context) => nextscreen,),
              (route) => false);
    }
  }


  waveNavigate({required context,required nextscreen,required pushtype}){
    if(pushtype=="push"){
      Navigator.push(
          context,
          WaveTransition(
              child: nextscreen,
              center: FractionalOffset(0.90, 0.90),
              duration: Duration(seconds: 2) // optional
          )
      );
    }else if(pushtype=="replace"){
      Navigator.pushReplacement(
          context,
          WaveTransition(
              child: nextscreen,
              center: FractionalOffset(0.90, 0.90),
              duration: Duration(seconds: 2) // optional
          )
      );
    }else if(pushtype=="remove"){
      Navigator.pushAndRemoveUntil(
          context, WaveTransition(
          child: nextscreen,
          center: FractionalOffset(0.90, 0.90),
          duration: Duration(seconds: 2) // optional
      ),
              (route) => false);
    }

  }




}






