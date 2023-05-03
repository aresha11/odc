import 'package:flutter/material.dart';

import 'event_mdel.dart';

class EventEditingPage extends StatefulWidget {
  const EventEditingPage({Key? key,this.event}) : super(key: key);
final Event? event;
  @override
  State<EventEditingPage> createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {

  ///parameters
  final formkey=GlobalKey<FormState>();
  final titlefieldController=TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.event==null){
      fromDate=DateTime.now();
      toDate=DateTime.now().add(Duration(hours: 2));
    }
  }


  @override
  void dispose() {
    titlefieldController.dispose();
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:CloseButton() ,
        actions: buildeditingaction(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildtitle(),
              SizedBox(height: 12,),
              buildDateTimePiker(),
            ],
          ),
        ),
      ),
    );

}



/// Functions



  List<Widget> buildeditingaction()=>[
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed:(){},
        icon:Icon(Icons.done),
         label: Text("save"))
  ];


  Widget buildtitle(){
    return TextFormField(
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: "Add Title",
      ),
      style: TextStyle(fontSize: 24),
      onFieldSubmitted: (context){},
      controller: titlefieldController,
      validator: (title){
        title!=null&&title.isEmpty?"Title Cannot Be Empity":null;
      },
    );
  }


  Widget buildDateTimePiker(){
    return Column(
      children: [
        buildForm(),
      ],
    );
  }

  Widget buildForm(){
    return Row(
      children: [
      //  Expanded(
            // child: buildDropDownField(
            //   text:Utils.toDate(fromDate);
         //   )
        //   )
      ],
    );
  }
}
