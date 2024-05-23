import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos/model/item_model.dart';
import 'package:todos/widgets/to_do_list/list_item_controller.dart';
import 'package:todos/widgets/to_do_list_item/item_controller.dart';

class ItemView extends StatelessWidget {
  final ItemController item;
  final ListItemController list;

  const ItemView({super.key, required this.item, required this.list});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              transform: item.isOpenMenu.value
                  ? Matrix4.translationValues(-90, 0, 0)
                  : Matrix4.identity(),
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                padding: const EdgeInsets.fromLTRB(15, 15, 5, 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      'lib/assets/img/planning.png',
                      width: 40,
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title.value,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          const Text(
                            'Date',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: () {
                        item.toggleOpenMenu();
                      },
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 0,
              bottom: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                transform: item.isOpenMenu.value
                    ? Matrix4.identity()
                    : Matrix4.translationValues(90, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        list.removeTodo(item.title.value);
                      },
                      icon: const Icon(EneftyIcons.trash_outline),
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
