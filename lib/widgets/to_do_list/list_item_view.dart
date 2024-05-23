import 'package:flutter/material.dart';
import 'package:todos/widgets/to_do_list/list_item_controller.dart';
import 'package:todos/widgets/to_do_list_item/item_view.dart';
import 'package:get/get.dart';

class ListItemView extends StatelessWidget {
  final ListItemController listItemController = Get.put(ListItemController());

  ListItemView({super.key});
  void handleTap(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: listItemController.todos.length,
                itemBuilder: (context, index) {
                  final item = listItemController.todos[index];
                  return ItemView(
                    item: item,
                    list: listItemController
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                listItemController.addTodo(value);
              },
              decoration: const InputDecoration(
                labelText: 'Add Todo',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
