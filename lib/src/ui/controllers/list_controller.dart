import 'package:flutter/cupertino.dart';
import 'package:list_app/src/src.dart';

class ListController {
  final ListServices _listServices = ListServices.instance;
  final ItemServices _itemServices = ItemServices.instance;

  final ValueNotifier<ListEntity?> list = ValueNotifier(null);
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  Future<void> createItem() async {
    if (list.value != null) {
      await _itemServices.create(
        listId: list.value!.id,
        title: titleController.text,
        description: descriptionController.text,
      );
    }
  }

  Future<void> update({
    required String itemId,
  }) async {
    if (list.value != null) {
      await _itemServices.update(
        itemId: itemId,
        listId: list.value!.id,
        title: titleController.text,
        description: descriptionController.text,
      );
    }
  }

  Future<void> delete({
    required String itemId,
  }) async {
    if (list.value != null) {
      await _itemServices.delete(
        itemId: itemId,
        listId: list.value!.id,
      );
    }
  }

  Future<void> fetchList() async {
    if (list.value == null) return;
    isLoading.value = true;
    final result = await _listServices.fetch(id: list.value!.id);

    result.fold(
      (l) => null,
      (r) => list.value = r,
    );
    isLoading.value = false;
  }

  Future<void> search() async {
    if (list.value != null && searchController.text.isNotEmpty) {
      isLoading.value = true;
      final items = await _itemServices.search(listId: list.value!.id, query: searchController.text);
      items.fold((l) => null, (r) => list.value = list.value?.copyWith(items: r));
      isLoading.value = false;
    }
  }
}
