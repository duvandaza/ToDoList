
import 'package:isar/isar.dart';
import 'package:todolist/common/Config/database/isar_open_db.dart';
import 'package:todolist/domain/datasources/task_datasource.dart';
import 'package:todolist/domain/entities/task.dart';

class IsarTaskDatasource extends TaskDatasources{

  late Future<Isar> db;
  
  IsarTaskDatasource(){
    db = IsarOpenDb().openDB();
  }

  @override
  Future<bool> editOrSaveTask(Task task) async{
    try{
      final isar = await db;
      await isar.writeTxn(() async{
        await isar.tasks.put(task);
      });
      return true;
    }catch(e){
      return false;
    }

  }

  @override
  Future<List<Task>> getAllTask() async {
    final isar = await db;
    final List<Task> tasks = await isar.tasks.where().findAll();
    return  tasks.reversed.toList();
  }
  
  @override
  Future<bool> deleteTask(int id) async {
    try {
      final isar = await db;
      await isar.writeTxn(() async{
        await isar.tasks.delete(id);
      });
      return true;
    } catch (e) {
      return false;
    }
    
  }


}