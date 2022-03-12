import 'package:flutter_app_todo_list/base/base_bloc.dart';
import 'dart:math';
import 'dart:async';
import 'package:flutter_app_todo_list/base/base_event.dart';
import 'package:flutter_app_todo_list/db/todo_table.dart';
import '../event/add_todo_event.dart';
import '../event/delete_todo_event.dart';
import '../model/todo.dart';

class TodoBloc extends BaseBloc {
  TodoTable _todoTable = TodoTable();

  StreamController<List<Todo>> _todoListStreamController =
      StreamController<List<Todo>>();
  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;

  var _randomInt = Random();
  List<Todo> _todoListData = List<Todo>.empty();

  initData() async {
    _todoListData = await _todoTable.selectAllTodo();

    if (_todoListData == null) {
      return;
    }

    _todoListStreamController.sink.add(_todoListData);
  }

  _addTodo(Todo todo) async {
    await _todoTable.insertTodo(todo);

    _todoListData.add(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  _deleteTodo(Todo todo) async {
    await _todoTable.deleteTodo(todo);

    _todoListData.remove(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddTodoEvent) {
      Todo todo = Todo.fromData(_randomInt.nextInt(1000000), event.content);
      _addTodo(todo);
    } else if (event is DeleteTodoEvent) {
      _deleteTodo(event.todo);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _todoListStreamController.close();
  }
}
