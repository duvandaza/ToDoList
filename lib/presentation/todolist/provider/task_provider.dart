

import 'package:flutter/foundation.dart';
import 'package:todolist/domain/entities/task.dart';
import 'package:todolist/infrastructure/datasources/isar_task_datasource.dart';
import 'package:todolist/infrastructure/repositories/task_repository_impl.dart';

class TaskProvider extends ChangeNotifier {

  List<Task> _tasks = [];


  final TaskRepositoryImpl taskImpl = TaskRepositoryImpl(IsarTaskDatasource());

  Future<bool> saveOreditTask(Task task) async {
    final result = await taskImpl.editOrSaveTask(task);
    if(result) await getAllTasks();
    return result;
  }

  Future getAllTasks() async{
    final result = await taskImpl.getAllTask();
    tasks = result;
  }

  Future<bool> deleteTask(int id) async {
    final result = await taskImpl.deleteTask(id);
    if(result) await getAllTasks();
    return result;
  }

  set tasks(List<Task> list){
    _tasks = list;
    notifyListeners(); 
  }

  List<Task> get tasks => _tasks;


}