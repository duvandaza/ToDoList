import 'package:flutter/material.dart';
import 'package:todolist/presentation/todolist/provider/task_provider.dart';
import 'package:todolist/presentation/todolist/screen/to_do_list_page.dart';
import 'package:provider/provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: ToDoListPage()
      ),
    );
  }
}