import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/todo.dart';
import 'package:jiffy/jiffy.dart';

class todoitem extends StatelessWidget {
  //
  final ToDoClass todoObject;
  const todoitem({super.key, required this.todoObject});
  // const todoitem({Key? key }) : super(key: key);

  // DateTime sTime = DateTime.parse(todoObject.startTime);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child:
      ListTile(
        shape: OutlineInputBorder(borderRadius: BorderRadius.all( Radius.circular(20))),
        selectedColor: Colors.orange,
        tileColor: Colors.deepPurple,
        title: Text(todoObject.title, style: const TextStyle(fontSize: 15)),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(
                      width: 12,
                    ),

                    Row(
                      children: [
                        Text(
                        DateFormat('hh:mm').format(todoObject.startTime)
                            // Jiffy(todoObject.startTime).format("MMMM do yy")
                        ),
                        const Text(" - "),
                        Text(
                            DateFormat('hh:mm').format(todoObject.endTime)
                          // Jiffy(todoObject.startTime).format("MMMM do yy")
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text(todoObject.note ,),
          ],
        ),
        isThreeLine: true,
        trailing: RotatedBox(
          quarterTurns: 3,
          child: RichText(
            text: TextSpan(
              text: 'TODO',
              style: TextStyle(fontSize: 10,color: Colors.white),


            ),
          ),
        ),


        // VerticalDivider(width: 5,),
      ),
    );
  }
}
