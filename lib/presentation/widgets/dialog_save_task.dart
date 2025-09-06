// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/common/theme/Colors.dart';
import 'package:todolist/domain/entities/task.dart';
import 'package:todolist/presentation/widgets/custom_text_form.dart';

import '../todolist/provider/task_provider.dart';

void dialogSaveTask(BuildContext context){
  TextEditingController taskController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  showDialog(
    context: context, 
    builder: (context) {
      final size = MediaQuery.of(context).size;
      
      return AlertDialog(
        title: const Text("Agregar una nueva tarea"),
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
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text("Cancelar"),
          ),
          MaterialButton(
            onPressed: () async {
              if (!formKey.currentState!.validate()) return;
              final taskProvider = Provider.of<TaskProvider>(context, listen: false);
              final result = await taskProvider.saveOreditTask(Task()
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
    }  
    

  );
}