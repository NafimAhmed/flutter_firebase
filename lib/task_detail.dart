



import 'package:careturor/update.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskDetail extends StatelessWidget{

  final String textTitle;
  final String textDetail;
  final String status;
  final String id;

  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User_profile");


   TaskDetail({super.key, required this.textTitle, required this.textDetail, required this.id, required this.status});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Task Detail"),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: (){
                      delete(context);
                    },
                    child: Icon(Icons.delete),
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: (){

                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UpdateTask(textTitle: textTitle, textDetail: textDetail, id: id)
                          )
                      );

                    },
                    child: Icon(Icons.edit),
                  ),
                )


              ],
            )
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text("${textTitle}",

                style: GoogleFonts.openSans(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),

              ),
              Text("Task Detail :",

                style: GoogleFonts.openSans(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),

              ),
              Text("${textDetail}",

                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),

            ],









          ),
        ),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 21),
        child: FloatingActionButton.extended(

          onPressed: (){

            uploadDone(context);


            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             AddTask()
            //     )
            // );

          },
          label: status!="true"?Text("Mark as done"):Text("Task is done"),
          hoverElevation: 100,
          icon: Icon(Icons.check_circle),
          splashColor: status!="true"?Colors.amber:Colors.grey,

          backgroundColor: status!="true"?Colors.green:Colors.grey,
        ),
      ),




    );
  }

  Future<void> uploadDone(var context) async {
    await ref.child("01797609439").child("profile").child("${id}").update({

      "TaskStatus": true,

    }).then((value) {
      Navigator.pop(context);
    });
  }

  Future<void> delete(var context) async {
    await ref.child("01797609439").child("profile").child("${id}").remove().then((value) {
      Navigator.pop(context);
    });
  }



}