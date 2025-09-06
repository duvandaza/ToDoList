import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/common/theme/Colors.dart';
import 'package:todolist/domain/entities/task.dart';
import 'package:todolist/presentation/todolist/provider/task_provider.dart';
import 'package:todolist/presentation/widgets/body_to_do_list.dart';
import 'package:todolist/presentation/widgets/dialog_save_task.dart';

class ToDoListPage extends StatelessWidget {
  const ToDoListPage({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  const Text('To do list', 
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold),),
          centerTitle: true,
          toolbarHeight: size.height * 0.075,
          elevation: 0,
          backgroundColor: colorPrimary,
        ),
        backgroundColor: colorSecundary,
        body: FutureBuilder(
          future: taskProvider.getAllTasks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
             return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, color: Colors.red[400], size: 100,),
                    const SizedBox(height: 20,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Ocurrió un error al traer la información. Si persiste, comunica con soporte',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      ),
                    ),
                    const SizedBox(height: 40,),
                  ],
                ),
              );
            }
            
            return Consumer<TaskProvider>(
              builder: (context, taskProvider, __) {
                final List<Task> listTask = taskProvider.tasks;
                if (listTask.isEmpty) {
                  return const Center(
                    child: Text('No hay tareas', style: TextStyle(color: Colors.white)),
                  );
                }
                return BodyToDoLIst(listTask:  taskProvider.tasks);
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            dialogSaveTask(context);
          },
          backgroundColor: colorPrimary,
          child: const Icon(Icons.add, size: 40, color: Colors.white,),
        ),
      ),
    );
  }
}
