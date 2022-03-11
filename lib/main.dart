import 'package:flutter/material.dart';

void main() {
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
        body: TodoListContainer(),
      ),
    );
  }
}

class TodoListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[],
      ),
    );
  }

  Widget _buildHeader() {
    var txtTodoController = TextEditingController();
    return Row(
      children: <Widget>[
        TextFormField(
          decoration:
              InputDecoration(labelText: 'Add todo', hintText: 'Add todo'),
        )
      ],
    );
  }
}
