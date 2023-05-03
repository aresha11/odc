import 'package:flutter/material.dart';

class Sections extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar:AppBar(
        leading:IconButton(icon:Icon(Icons.arrow_back_ios,color:Colors.deepOrange,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor:Colors.white,
        title:Text("Sections",style:TextStyle(color:Colors.black,fontSize:30),),
      ),
      body:FutureBuilder(
        future:GetData(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                itemCount:snapshot.data!.length,
                itemBuilder: (context,index)=>
                    Container(
                      child:Card(
                        child: ListTile(
                          title: Text(snapshot.data![index].title),
                          subtitle:Text(snapshot.data![index].starttime),
                          trailing: Text(snapshot.data![index].examdate),
                        ),
                      ),
                    )
            );
          }else{
            return Center(
              child:CircularProgressIndicator(),
            );
          }

        },),
    );
  }

}



class data {
  String timer;
  String title;
  String starttime;
  String endtime;
  String examdate;
  data(this.timer,this.title,this.starttime,this.endtime,this.examdate);
}

List sectionlist = [
  data("2hrs","Sec A","12,00pm","2:00pm","2/3/2022"),
  data("3hrs","Sec B","12,00pm","2:00pm","2/3/2022"),
  data("4hrs","Sec C","12,00pm","2:00pm","2/3/2022"),
  data("5hrs","Sec D","12,00pm","2:00pm","2/3/2022"),
  data("2hrs","Sec E","12,00pm","2:00pm","2/3/2022"),
];








Future<List>GetData() async {
  List terms ;
  terms =await Future.delayed(Duration(seconds:2)).then((value) => sectionlist);
  return terms;
}