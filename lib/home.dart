



import 'package:careturor/add_task.dart';
import 'package:careturor/task_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
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
            ListView.builder(

              shrinkWrap: true,
              physics: ScrollPhysics(),

              itemCount: 15,
                itemBuilder:(context,index){
              return ListTile(
                title: Text("Task Title"),
                subtitle: Text("Task Detail"),
                onTap: (){

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TaskDetail()
                      )
                  );

                },
              );
            }


            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 21),
        child: FloatingActionButton.extended(

          onPressed: (){

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddTask()
                )
            );

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