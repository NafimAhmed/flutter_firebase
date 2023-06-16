



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskDetail extends StatelessWidget{

  final String textTitle;
  final String textDetail;
  final String id;

  const TaskDetail({super.key, required this.textTitle, required this.textDetail, required this.id});

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

                    },
                    child: Icon(Icons.delete),
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: (){

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

            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             AddTask()
            //     )
            // );

          },
          label: Text("Task Done"),
          hoverElevation: 100,
          icon: Icon(Icons.check_circle),
          splashColor: Colors.amber,

          backgroundColor: Colors.green,
        ),
      ),




    );
  }

}