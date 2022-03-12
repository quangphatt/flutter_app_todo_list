import 'package:flutter/material.dart';
import 'package:flutter_app_todo_list/bloc/todo_bloc.dart';
import 'package:flutter_app_todo_list/db/todo_database.dart';
import 'package:provider/provider.dart';
import 'todo/todo_list_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoDatabase.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo List"),
        ),
        body: Provider<TodoBloc>.value(
            value: TodoBloc(), child: TodoListContainer()),
      ),
    );
  }
}
