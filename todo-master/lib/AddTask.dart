import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'home.dart';
import 'package:to_do_list/todo.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  TimeOfDay _timeStart = const TimeOfDay(hour: 6, minute: 16);
  TimeOfDay _timeEnd = const TimeOfDay(hour: 6, minute: 16);

  late SingleValueDropDownController _DropDownTextFieldController;

  var selectedRemind = "5 min";

  var selectedRepeat = "None";
  TextEditingController titleInput = TextEditingController();
  TextEditingController noteInput = TextEditingController();

  TextEditingController dateInput = TextEditingController();
  TextEditingController timeStartinput = TextEditingController();
  TextEditingController timeEndinput = TextEditingController();
  TextEditingController RemindInput = TextEditingController();
  TextEditingController RepeatInput = TextEditingController();

  List<ToDoClass> theList = ToDoClass.todoList();

  get title => this.title;

  get note => this.note;
  get startTime => this.startTime;
  get endTime => this.endTime;

  test() {
    for (var x in theList) {
      print(x.endTime);
    }
  }

  check(String title, String note, DateTime startTime , DateTime endTime) {
    var formData = formKey.currentState;
    //  assert(formData == null );
    if (formData != null) {
      if (formData.validate()) {
        print(theList);
        print(theList.length);

        setState(() {
          theList.insert(0,
            ToDoClass(id: DateTime.now().microsecond.toString(),
                title: title ,
                note: note, startTime: startTime , endTime: endTime) ,

          );

          print(theList.first.title);
         });
        print(theList.length);
        print(theList.first.title);

        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => home(
                title: titleInput.text,
                note: noteInput.text,
                //
                // startTime: DateTime.now(),
                //
                // endTime: DateTime.now()
              endTime: DateTime.now().day,
              startTime: DateTime.now().day,
            )
        )
        );

        // Navigator.of(context).push(MaterialPageRoute(
        //     builder:(context)=> home(title: dateInput.text,
        //       note: RemindInput.text,
        //       endTime: DateTime.now().day as String,
        //       startTime: DateTime.now().day as String,)));
        print("valid");
      }
      else {
        print("Not valid");
      }



    }
  }


  @override
  void initState() {
    _DropDownTextFieldController = SingleValueDropDownController();
    dateInput.text = "9/11/2023";
   timeStartinput.text = "9:50 PM";
   timeEndinput.text = "9:50 PM";
    RemindInput.text = "5 min";
    RepeatInput.text = "None";
    titleInput.text = "";
    noteInput.text = "";
    super.initState();
  }

  @override
  void dispose() {
    _DropDownTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.blueAccent,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => home(
                    title: "",
                    note: "",
                      startTime: DateTime.now().day,
                      endTime: DateTime.now().day
                    // endTime: DateTime.now().day,
                    // startTime: DateTime.now().day,
                  )
              )
              );
            },
          ),
          actions: [
            ClipRRect(

              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                "assets/images/avatar.png",
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Center(child: Text("Add Task" ,style: TextStyle(fontFamily: AutofillHints.countryName , fontSize: 20),)),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Title ",
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  TextFormField(
                    controller: titleInput,
                    validator: (text) {
                      if (text != null) {
                        if (text.length < 1) {
                          return "please, Enter a title";
                        }
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        // labelText: "Enter Title here",
                        hintText: "Enter Title here",
                        // labelStyle: TextStyle(color: Colors.black12),

                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: const Text(
                      "Note",
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  TextFormField(
                    controller: noteInput,
                    validator: (text) {
                      if (text != null) {
                        if (text.length < 1) {
                          return "please, Enter a Note";
                        }
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        // labelText: "Enter note here",
                        // labelStyle: TextStyle(color: Colors.black12),
                        hintText: "Enter note here",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: const Text(
                      "Date ",
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text != null) {
                        if (text.length < 1) {
                          return "please, Enter a Date";
                        }
                        return null;
                      }
                    },
                    controller: dateInput,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        )),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2050));

                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                            DateFormat('M/dd/yyyy').format(pickedDate);
                        print(formattedDate);
                        setState(() {
                          dateInput.text = formattedDate;
                        });
                      } else {}
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(

                        child: Column(
                          children: [
                            Container(
                              child: const Text(
                                "Start Time",
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            Container(
                              // width: 150,
                              child: TextFormField(
                                validator: (text) {
                                  if (text != null) {
                                    if (text.length < 1) {
                                      return "please, Enter the Start time";
                                    }
                                    return null;
                                  }
                                },
                                controller: timeStartinput,
                                decoration: InputDecoration(
                                    // labelText: "Enter start time",
                                    // labelStyle:
                                    //     const TextStyle(color: Colors.black12),
                                    suffixIcon: const Icon(Icons.access_time),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    )),
                                readOnly: true,
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );

                                  setState(() {
                                    if (pickedTime != null) {
                                      timeStartinput.text =
                                          pickedTime.format(context);
                                    }
                                  });
                                  // if (pickedTime!=null){
                                  //   print("object");
                                  //   print(pickedTime.format(context));
                                  //   print("ob2");
                                  //   DateTime convertedTime = DateTime.parse(pickedTime.format(context).toString());
                                  //    print(convertedTime);
                                  //    print("be");
                                  //     String formattedTime = DateFormat('HH:mm').format(convertedTime);
                                  //  print("skf");
                                  //   print(formattedTime);
                                  //
                                  //   setState(() {
                                  //     dateInput.text = formattedTime;
                                  //     timeStartinput.text = "formattedTime";
                                  //
                                  //   });
                                  // }
//                     else{
//
//
//
// print ("not valid");
//                     }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              child: const Text(
                                "End Time",
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            Container(
                              // width: 150,
                              child: TextFormField(

                                validator: (text) {
                                  if (text != null) {
                                    if (text.length < 1) {
                                      return "please, Enter the End time";
                                    }
                                    return null;
                                  }
                                },
                                controller: timeEndinput,
                                decoration: InputDecoration(
                                    // labelText: "Enter End time",
                                    // labelStyle:
                                    //     const TextStyle(color: Colors.black12),
                                    suffixIcon: const Icon(Icons.access_time),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    )),
                                readOnly: true,
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  setState(() {
                                    if (pickedTime != null) {
                                      timeEndinput.text =
                                          pickedTime.format(context);
                                    }
                                  });
                                  // if (pickedTime!=null){
                                  //   print(pickedTime.format(context));
                                  //   DateTime convertedTime = DateTime.parse(pickedTime.format(context).toString());
                                  //   print(convertedTime);
                                  //   String formattedTime = DateFormat('HH:mm').format(convertedTime);
                                  //   print(convertedTime);
                                  //
                                  //   setState(() {
                                  //     timeEndinput.text = formattedTime;
                                  //
                                  //   });
                                  // }
                                  // else{
                                  //
                                  // }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: const Text(
                      "Remind",
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  DropDownTextField(
                    initialValue: "5 min early",
                    // validator: (text){
                    //
                    //   if(text !=null){
                    //     if (text.length < 1) {
                    //       return "Choose please";
                    //     }  return null;
                    //   }
                    //
                    //
                    // },
                    dropDownList: ["5 min early ", "10 min early"]
                        .map((e) => DropDownValueModel(
                              name: "$e",
                              value: e,
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: const Text(
                      "Repeat ",
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  DropDownTextField(
                    // validator: (text){
                    //   if (text?.length! < 1) {
                    //     return "please, Enter a title";
                    //   }  return null;
                    //
                    // },
                    initialValue: "None",
                    dropDownList: ["None ", "every day ", "every week"]
                        .map((e) => DropDownValueModel(
                              name: "$e",
                              value: e,
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed:
                        (){
                          setState(() {
                            check( titleInput.text,
                                noteInput.text,
                                DateTime.parse(timeStartinput.text),
                                DateTime.parse(timeEndinput.text) );
                          });
                        },

                        child: Container(
                          width: 20,
                          child: const Text("ok"),
                          alignment: Alignment.bottomRight,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
