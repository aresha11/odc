import 'package:flutter/material.dart';

class Event{
  final String title;
  final String descroption;
  final DateTime from;
  final DateTime to;
  final Color backgroundcolor;
  final bool isAllDay;

Event({
  required this.title,
  required this.descroption,
  required this.from,
  required this.to,
  this.backgroundcolor=Colors.lightGreen,
  this.isAllDay=false,
});
}