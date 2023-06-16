



import 'package:careturor/task_detail.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTask extends StatelessWidget{


  TextEditingController TaskTitleController=TextEditingController();
  TextEditingController TaskDetailController=TextEditingController();

  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User_profile");




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("Add a new task"),
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




              await ref.child("01797609439").child("profile").push().set({
                "TaskTitle": "${TaskTitleController.text}",
                "TaskDetail": "${TaskDetailController.text}",
                "TaskStatus": false,




                // "address": {
                //   "line1": "100 Mountain View"
                // }
              }).then((value) {
                Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return MainScreen();
                //     },
                //   ),
                // );
              });

              // Navigator.pop(context);
              //
              // // Navigator.push(
              // //     context,
              // //     MaterialPageRoute(
              // //         builder: (context) =>
              // //             BottomBar()));
              //
              // Get.to(BottomBar(),
              //     duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
              //     transition: Transition.rightToLeft );
              //



            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: 60.0, vertical: 15.0),
              primary: Colors.pink,
              shape: StadiumBorder(),
            ),
            child: Text(
              "Add Task",
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