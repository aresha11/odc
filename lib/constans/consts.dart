import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../presentation/screens/home_screen/home_pages/event_page/events.dart';
import '../presentation/screens/home_screen/home_pages/finals_pages/finals.dart';
import '../presentation/screens/home_screen/home_pages/lectures_page/lectures.dart';
import '../presentation/screens/home_screen/home_pages/midterms_page/midterms.dart';
import '../presentation/screens/home_screen/home_pages/notes_page/notes.dart';
import '../presentation/screens/home_screen/home_pages/sections_page/sections.dart';

class Constants{

  static List icons=[Icon(Icons.book,size: 40.sp,color: Colors.deepOrange,),
    Icon(Icons.people,size: 40.sp,color: Colors.deepOrange,),
    Icon(Icons.text_snippet,size: 40.sp,color: Colors.deepOrange,),
    Icon(Icons.event,size: 40.sp,color: Colors.deepOrange,),
    Icon(Icons.event_note,size: 40.sp,color: Colors.deepOrange,),
    Icon(Icons.note_alt,size: 40.sp,color: Colors.deepOrange,)];
 static List titles=["Lectures",
   "Sections",
   "Midterms",
   'finals',
   "Events",
   "Notes"];
 static List pages=[Lectures(),Sections(),MidTermsScreen(),Finals(),Eventss(),Notes()];


}