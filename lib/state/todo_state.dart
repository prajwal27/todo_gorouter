import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_gorouter/model/todo_item.dart';
import 'package:todo_gorouter/utils/constants.dart';

class TodoState extends ChangeNotifier {
  List<TodoItem> items = <TodoItem>[];
  final SharedPreferences sharedPreferences;
  int idCounter = 1;

  TodoState(this.sharedPreferences) {
    getItemsFromDB();
    idCounter = items.length + 1;
  }

  void addTodo(String message) {
    TodoItem todoItem = TodoItem(
      id: idCounter,
      message: message,
      status: Status.pending,
    );
    idCounter++;
    items.add(todoItem);
    saveToDB();
    notifyListeners();
  }

  TodoItem? getItem(String? id) {
    int index = items.indexWhere(
        (element) => id == '${element.id}' && element.status != Status.deleted);
    return index == -1 ? null : items[index];
  }

  bool changeStatus(int id, Status status) {
    final int index = items.indexWhere((element) => element.id == id);
    if (index == -1) {
      return false;
    }
    items[index] = items[index].copyWith(status: status);
    saveToDB();
    notifyListeners();
    return true;
  }

  List<TodoItem> getItems(Status status) {
    return items.where((element) => element.status == status).toList();
  }

  // bool deleteItem(int id) {
  //   try {
  //     final int index = items.indexWhere((element) => element.id == id);
  //
  //     items.removeWhere((element) => element.id == id);
  //     notifyListeners();
  //   } on Exception catch (e) {
  //     print('Exception deleting item with id:$id, error ${e.toString()}');
  //     return false;
  //   }
  //   return true;
  // }

  // save
  void saveToDB() async {
    String itemsString = jsonEncode(items);
    sharedPreferences.setString(itemsKey, itemsString);
  }

  void getItemsFromDB() async {
    String? itemsString = sharedPreferences.getString(itemsKey);

    if (itemsString == null) {
      items = <TodoItem>[];
    } else {
      items = (jsonDecode(itemsString) as List)
          .map((e) => TodoItem.fromMap(e))
          .toList();
    }
  }

  void clearAllItems() {
    items.clear();
    sharedPreferences.clear();
    notifyListeners();
  }
}
