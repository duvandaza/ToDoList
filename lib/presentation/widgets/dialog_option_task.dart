

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/domain/entities/task.dart';
import 'package:todolist/presentation/todolist/provider/task_provider.dart';
import 'package:todolist/presentation/widgets/custom_text_form.dart';
import 'package:todolist/common/theme/Colors.dart';

void dialogOptionTask(Task task, BuildContext context) {
  TextEditingController taskController = TextEditingController();
  taskController.text = (task.title == null) ? '' : task.title!;
  final taskProvider = Provider.of<TaskProvider>(context, listen: false);
  final size = MediaQuery.of(context).size;
  final formKey = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Opciones Tarea"),
        content: SizedBox(
          height: size.height * 0.13,
          child: Form(
            key: formKey,
            child: InputTextValidation(
              titulo: "Tarea",
              controller: taskController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Campo no puede estar vacío";
                }
                return null;
              },
            ),
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () async {
              final result = await taskProvider.deleteTask(task.isarId!);
              if(result){
                Navigator.pop(context);
              }
            },
            child: const Text("Eliminar", style: TextStyle(color: Colors.red),),
          ),
          MaterialButton(
            onPressed: () async {
              if (!formKey.currentState!.validate()) return;
              final result = await taskProvider.saveOreditTask(Task()
                ..isarId = task.isarId
                ..state = false
                ..title = taskController.text
              );
              if(result){
                Navigator.pop(context);
              }
            },
            child: Text("Guardar", style: TextStyle(color: botonColor),),
          ),
          
        ],
      );
    },
  );
}