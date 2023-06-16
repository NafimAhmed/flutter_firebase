



import 'package:careturor/task_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTask extends StatelessWidget{


  TextEditingController TaskTitleController=TextEditingController();
  TextEditingController TaskDetailController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
              maxLines: 6,
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


        ],
      ),
    );
  }

}