import 'package:flutter/material.dart';
import '../model/task.dart';
import '../widget/taskwidget.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key? key,
    required this.tasklist,
  }) : super(key: key);

  final List<Task> tasklist;

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      children: widget.tasklist.map<ExpansionPanelRadio>((taskitem) {
        return ExpansionPanelRadio(
          value: taskitem.id,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return TaskWidgetPage(taskitem: taskitem);
          },
          body: const Text("description"),
        );
      }).toList(),
    );
  }
}




// ListView.separated(
//         primary: false,
//         shrinkWrap: true,
//         //physics: ,
//         itemBuilder: (context, index) {
//           return TaskWidgetPage(taskitem: tasklist[index]);
//         },
//         separatorBuilder: (context, index) {
//           return const SizedBox(
//             height: 10,
//           );
//         },
//         itemCount: tasklist.length);