

import 'package:todolist/domain/entities/task.dart';
import 'package:todolist/domain/repositories/task_repository.dart';

import '../../domain/datasources/task_datasource.dart';

class TaskRepositoryImpl extends TaskRepository {
  
  late TaskDatasources datasource;
  
  TaskRepositoryImpl(this.datasource);

  @override
  Future<bool> editOrSaveTask(Task task) {
    return datasource.editOrSaveTask(task);
  }

  @override
  Future<List<Task>> getAllTask() {
    return datasource.getAllTask();
  }
  
  @override
  Future<bool> deleteTask(int id) {
    return datasource.deleteTask(id);
  }
  


}