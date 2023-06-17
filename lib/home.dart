



import 'package:careturor/add_task.dart';
import 'package:careturor/task_detail.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget{


  Query dbref=FirebaseDatabase.instance.ref("User_profile").child("01797609439").child("profile");//.child(widget.phoneNumber).child("Notifications");



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [



            FirebaseAnimatedList(

              physics: ScrollPhysics(),
              shrinkWrap: true,
              query: dbref,
              reverse: true,
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {




                return ListTile(
                  leading: snapshot.child("TaskStatus").value==true?Icon(Icons.done_all,

                    color: Colors.green,
                    size: 40,

                  ):Icon(Icons.speed,

                    color: Colors.deepOrange,
                    size: 40,

                  ),
                        title: Text("${snapshot.child("TaskTitle").value}",

                          maxLines: 1,

                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),

                        ),
                        subtitle: Text("${snapshot.child("TaskDetail").value}",
                          maxLines: 1,
                        ),
                        onTap: (){



                          Get.to(TaskDetail(
                                          textTitle: "${snapshot.child("TaskTitle").value}",
                                          textDetail: "${snapshot.child("TaskDetail").value}",
                                          id: "${snapshot.key}",
                                          status: "${snapshot.child("TaskStatus").value}",
                                        ),
                              duration: Duration(milliseconds: 100), //duration of transitions, default 1 sec
                              transition: Transition.rightToLeft );



                        },
                      );

              },

            ),





            // ListView.builder(
            //
            //   shrinkWrap: true,
            //   physics: ScrollPhysics(),
            //
            //   itemCount: 15,
            //     itemBuilder:(context,index){
            //   return ListTile(
            //     title: Text("Task Title"),
            //     subtitle: Text("Task Detail"),
            //     onTap: (){
            //
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) =>
            //                   TaskDetail()
            //           )
            //       );
            //
            //     },
            //   );
            // }
            //
            //
            // ),







          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 21),
        child: FloatingActionButton.extended(

          onPressed: (){



            Get.to(AddTask(),
                duration: Duration(milliseconds: 100), //duration of transitions, default 1 sec
                transition: Transition.rightToLeft );

          },
          label: Text("Add Task"),
          hoverElevation: 100,
          icon: Icon(Icons.note_add_outlined),
          splashColor: Colors.purple,

          backgroundColor: Colors.pink.shade500,
        ),
      ),



    );
  }

}