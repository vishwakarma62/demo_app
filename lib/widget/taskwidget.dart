import 'package:demo_app/bloc/exportbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/task.dart';

// ignore: must_be_immutable
class TaskWidgetPage extends StatefulWidget {
  TaskWidgetPage({super.key, required this.taskitem});
  Task taskitem;

  @override
  State<TaskWidgetPage> createState() => _TaskWidgetPageState();
}

void _removeOrdeletetask(BuildContext ctx, Task task) {
  task.isdeleted!
      ? ctx.read<TaskBloc>().add(DeleteTaskEvent(task: task))
      : ctx.read<TaskBloc>().add(RemoveTaskEvent(task: task));
}

class _TaskWidgetPageState extends State<TaskWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Text(
        widget.taskitem.title,
        style: TextStyle(
            decoration: widget.taskitem.isdeleted == false
                ? null
                : TextDecoration.lineThrough),
      ),
      onLongPress: () {
        _removeOrdeletetask(context, widget.taskitem);
      },
      trailing: Checkbox(
          value: widget.taskitem.isdone,
          onChanged: widget.taskitem.isdeleted == false
              ? (value) {
                  context
                      .read<TaskBloc>()
                      .add(UpdateTaskEvent(task: widget.taskitem));
                }
              : null),
    );
  }
}
