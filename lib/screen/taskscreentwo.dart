import 'package:demo_app/bloc/exportbloc.dart';
import 'package:demo_app/service/guid_gen.dart';
import 'package:flutter/material.dart';


import '../model/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleCTR = TextEditingController();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const Text(
            "Add Task",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 24,
          ),
          TextField(
            autofocus: true,
            controller: titleCTR,
            decoration: const InputDecoration(
              label: Text("title"),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            children: [
              TextButton(onPressed: () {}, child: const Text("cancel")),
              TextButton(
                  onPressed: () {
                    var task = Task(title: titleCTR.text, id: GUIDGen.generate(),);
                    context.read<TaskBloc>().add(AddTaskEvent(task: task));
                   
                    Navigator.pop(context);
                  },
                  child: const Text("Add")),
            ],
          ),
        ],
      ),
    );
  }
}
