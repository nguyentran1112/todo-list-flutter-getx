import 'package:get/get.dart';
import 'package:todos/model/item_model.dart';
import 'package:todos/widgets/to_do_list_item/item_controller.dart';

class ListItemController extends GetxController {
  var todos = <ItemController>[].obs;
  void addTodo(String title) {
    todos.add(ItemController(title));
  }
}
