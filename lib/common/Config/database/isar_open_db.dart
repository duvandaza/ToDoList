
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todolist/domain/entities/task.dart';

class IsarOpenDb{

  Future<Isar> openDB() async{
    final dir = await getApplicationDocumentsDirectory();
    if(Isar.instanceNames.isEmpty){
      return await Isar.open(
        [
          TaskSchema,
        ], 
        directory: dir.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

}