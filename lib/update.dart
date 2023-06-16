

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateTask extends StatelessWidget{


  TextEditingController TaskTitleController=TextEditingController();
  TextEditingController TaskDetailController=TextEditingController();

  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User_profile");


  final String textTitle;
  final String textDetail;
  //final String status;
  final String id;

   UpdateTask({super.key, required this.textTitle, required this.textDetail, required this.id});



  @override
  Widget build(BuildContext context) {

    TaskDetailController.text=textDetail;
    TaskTitleController.text=textTitle;
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("Update Task"),
      ),

      body: Column(
        children: [


          Padding(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            child:TextField(
              maxLines: 1,
              controller: TaskTitleController,
              decoration: InputDecoration(
                  labelText: "Task title",
                  labelStyle: GoogleFonts.raleway(

                  ),
                  floatingLabelStyle: GoogleFonts.raleway(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,

                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  filled: true,
                  fillColor: Colors.white70,
                  hintText: "Task Title",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.pink,
                          width: 1.0
                      )
                  )
              ),
            ),),

          Padding(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            child:TextField(
              maxLines: 10,
              controller: TaskDetailController,
              decoration: InputDecoration(
                  labelText: "Task Detail",
                  labelStyle: GoogleFonts.raleway(

                  ),
                  floatingLabelStyle: GoogleFonts.raleway(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.pink,

                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  filled: true,
                  fillColor: Colors.white70,
                  hintText: "task Detail",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.pink,
                          width: 1.0
                      )
                  )
              ),
            ),),



          ElevatedButton(
            onPressed: () async {




              await ref.child("01797609439").child("profile").child("${id}").update({

                "TaskDetail": "${TaskDetailController.text}",
                "TaskTitle":"${TaskTitleController.text}"

              }).then((value) {
                Navigator.pop(context);
              });


            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: 60.0, vertical: 15.0),
              primary: Colors.pink,
              shape: StadiumBorder(),
            ),
            child: Text(
              "Update Task",
              style: TextStyle(color: Colors.white, fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),


        ],
      ),

    );
  }

}