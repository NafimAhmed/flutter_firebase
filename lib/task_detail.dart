



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskDetail extends StatelessWidget{
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

      body: Column(


        children: [

          Text("Task Title"),
          Text("Task Detail :"),
          Text("Task detail"),

        ],
      ),
    );
  }

}