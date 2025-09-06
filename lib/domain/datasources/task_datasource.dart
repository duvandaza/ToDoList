

import 'package:todolist/domain/entities/task.dart';

abstract class TaskDatasources {

  // Future<bool> saveTask(Task task); 

  Future<List<Task>> getAllTask();

  Future<bool> editOrSaveTask(Task task);

  Future<bool> deleteTask(int id);

}