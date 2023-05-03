import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        leading: const BackButton(color: Colors.white,),
        title: Text("News",style: TextStyle(fontSize: 20.sp,color: Colors.white),),),
      body:Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                    future: getTerms(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data,
                          style:
                          TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300),
                        );
                      } else {
                        return const CircularProgressIndicator(color: Colors.deepOrange,);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<String> getTerms() async {
  String terms;
  terms = await Future.delayed(const Duration(seconds: 2)).then((value) =>"" );
  return terms;
}
