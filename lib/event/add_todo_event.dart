import 'package:flutter_app_todo_list/base/base_event.dart';

class AddTodoEvent extends BaseEvent {
  String content;

  AddTodoEvent(this.content);
}
