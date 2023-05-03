import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:orangedegitalcenter/presentation/screens/home_screen/home.dart';
import 'package:orangedegitalcenter/presentation/screens/news_screen/notes.dart';
import 'package:orangedegitalcenter/presentation/screens/setting_screen/settins.dart';
import 'package:sizer/sizer.dart';

import '../../reusable_component/custom_appbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
///
List pages=[Home_content(), News(),setting_content()];
List titles=["Home","News","Setting"];
int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.sp),
            child: CustumAppBar("${titles[_currentIndex]}")),
      body:pages[_currentIndex],
      bottomNavigationBar: GNav(
       // backgroundColor: Colors.grey.withOpacity(0.5) ,
        onTabChange: (index){
          _currentIndex=index;
          setState(() {

          });
        },
          rippleColor: Colors.grey, // tab button ripple color when pressed
          hoverColor: Colors.black, // tab button hover color
          haptic: true, // haptic feedback
         // tabBorderRadius: 15,
         // tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
         // tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
          //tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
          curve: Curves.easeInCirc, // tab animation curves
          duration: Duration(milliseconds: 900), // tab animation duration
          gap: 0, // the tab button gap between icon and text
          color: Theme.of(context).colorScheme.onPrimary, // unselected icon color
          activeColor: Theme.of(context).colorScheme.primary, // selected icon and text color
          iconSize: 24.sp, // tab button icon size
          tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),

          tabs: const
          [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.newspaper,
              text: 'News',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Setting',
            ),

          ]
      )
    );
  }

  }


