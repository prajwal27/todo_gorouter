import 'package:todo_gorouter/model/todo_item.dart';

extension Value on Status {
  String get getValue => this == Status.pending ? 'Pending' : 'Completed';
}
