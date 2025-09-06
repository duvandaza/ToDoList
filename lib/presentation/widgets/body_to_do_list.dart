
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/domain/entities/task.dart';
import 'package:todolist/presentation/widgets/dialog_option_task.dart';
import '../../common/theme/Colors.dart';
import '../todolist/provider/task_provider.dart';


class BodyToDoLIst extends StatelessWidget {
  const BodyToDoLIst({super.key, required this.listTask});
  final List<Task> listTask;
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return  Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: listTask.length,
        itemBuilder: (BuildContext context, int index) {
          final Task task = listTask[index];
          return InkWell(
            onTap: () {
              dialogOptionTask(task, context);
            },
            child: Container(
              height: size.height * 0.08,
              width: size.width * 0.8,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children:  [
                  Checkbox(
                    value: task.state,
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.white
                    ),
                    onChanged: (value) async{
                      final taskProvider = Provider.of<TaskProvider>(context, listen: false);
                      await taskProvider.saveOreditTask(
                        Task()
                        ..isarId = task.isarId
                        ..state = value
                        ..title = task.title
                      );
                    },
                  ),
                   Text((task.title == null) ? '' : task.title!,
                    style: TextStyle(
                      color:task.state! ? Colors.white54 : Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      decoration: task.state! ? TextDecoration.lineThrough : TextDecoration.none,
                      decorationThickness: 3,
                      decorationColor: Colors.white60
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}