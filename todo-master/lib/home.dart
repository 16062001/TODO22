import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:to_do_list/todoItem.dart';
import 'package:to_do_list/todo.dart';
import 'package:weekday_scroller/weekday_scroller.dart';
import 'package:to_do_list/todo.dart';
class home extends StatefulWidget {
  String title, note;
  late int startTime, endTime;

  home({
    super.key,
    required this.title,
    required this.note,
    required this.startTime,
    required this.endTime,
  });

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final List theList = ToDoClass.todoList();

  // get title => this.title;
  //
  // get note => this.note;
  // get startTime => this.startTime;
  // get endTime => this.endTime;

  @override
  void initState() {
    theList;
    super.initState();
  }

  DateTime _selectedDay = DateTime.now();
  var r = Jiffy(DateTime.now()).format("yMMMMEEEEd");
  late  ToDoClass todoObject;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.sunny),
        actions: [
          const Icon(Icons.filter_list_alt),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              "assets/images/avatar.png",
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text("{$_selectedDay}"),
                  Text(r,style: TextStyle(fontSize: 20),),
                  Container(
                    margin: EdgeInsets.all(20),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("AddTask");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                        ),
                        child: const Text("+ Add Task ")),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
              ),
                    child: WeekdayScroller(
                      selectedDay: _selectedDay,
                      changeDay: (value) => setState(() {
                        _selectedDay = value;
                      }),
                      backgroundColor: Colors.black26,
                      enableWeeknumberText: false,
                      weeknumberColor: const Color(0xFF57AF87),
                      weeknumberTextColor: Colors.white,

                      weekdayTextColor: const Color(0xFF8A8A8A),
                      digitsColor: Colors.white,
                      selectedBackgroundColor: Colors.deepPurple,
                      // weekdays: ["Mo", "Tu", "We", "Th", "Fr"],
                      // daysInWeek: 5,
                    ),
                  ),
                ],
              ),


              //
              // ListView.builder(
              //     itemCount: theList.length,
              //     shrinkWrap: true,
              //     itemBuilder: (context,index)=>
              //    Expanded(child: Column(children: [for (ToDoClass todoiteem in theList)
              //      todoitem(
              //        todoObject: todoiteem,
              //      ),],))
              //  ),

              ListTile(
                shape: OutlineInputBorder(borderRadius: BorderRadius.all( Radius.circular(20))),
                selectedColor: Colors.orange,
                tileColor: Colors.deepPurple,
                title: Text(widget.title, style: const TextStyle(fontSize: 12)),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.access_time),
                            const SizedBox(
                              width: 5,
                            ),

                            Row(
                              children: [
                                Text(
                                  "2:04 PM",
                                  style: const TextStyle(fontSize: 12),
                                ),
                                const Text(" - "),
                                Text("2:19 PM",
                                    style: const TextStyle(fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(widget.note),
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

              ),
              for (ToDoClass todoiteem in theList)
                todoitem(
                  todoObject: todoiteem,
                ),


            ],
          ),
        ),
      ),
    );
  }
}
