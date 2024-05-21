import 'package:todos/widgets/to_do_list_item/item_controller.dart';

class Item {
  String title;
  ItemController controller;

  Item({
    required this.title,
    required this.controller,
  });
}
