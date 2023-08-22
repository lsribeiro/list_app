import 'package:flutter/material.dart';
import 'package:list_app/src/src.dart';

class ListsView extends StatefulWidget {
  const ListsView({Key? key}) : super(key: key);

  @override
  State<ListsView> createState() => _ListsViewState();
}

class _ListsViewState extends State<ListsView> {
  final _listController = ListController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final list = ModalRoute.of(context)!.settings.arguments as ListEntity;
      _listController.list.value = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'ToDo List',
                  style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                    fontSize: 50,
                  ),
                ),
                IconButton(
                    iconSize: 40,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextField(
                                  decoration: const InputDecoration(hintText: 'Item name'),
                                  controller: _listController.searchController,
                                ),
                                InkWell(
                                  onTap: () {
                                    _listController.search().then((value) => Navigator.pop(context));
                                  },
                                  child: const Text(
                                    'Search',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontFamily: 'Oswald',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.search_outlined,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ValueListenableBuilder<ListEntity?>(
                    valueListenable: _listController.list,
                    builder: (context, list, _) {
                      return list != null
                          ? Text(
                              list.name,
                              style: const TextStyle(
                                fontSize: 40,
                                fontFamily: 'Oswald',
                              ),
                            )
                          : const SizedBox();
                    }),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          _listController.titleController.clear();
                          _listController.descriptionController.clear();
                          return ItemDialog(
                            height: 200,
                            titleTextController: _listController.titleController,
                            descriptionTextController: _listController.descriptionController,
                            onComplete: () {
                              _listController.createItem().then((value) {
                                _listController.fetchList().then((value) => Navigator.pop(context));
                              });
                            },
                            completeButtonText: 'Create',
                          );
                        });
                  },
                  child: const Text(
                    'Add Item +',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder<ListEntity?>(
          valueListenable: _listController.list,
          builder: (context, list, _) {
            return RefreshIndicator(
              onRefresh: () async => _listController.fetchList(),
              child: ValueListenableBuilder<bool>(
                  valueListenable: _listController.isLoading,
                  builder: (context, isLoading, _) {
                    return ListView(
                      children: list != null && !isLoading
                          ? list.items
                              .map<Widget>(
                                (e) => ItemTile(
                                  margin: const EdgeInsets.all(8),
                                  title: e.title,
                                  description: e.description,
                                  onTapEdit: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          _listController.titleController.text = e.title;
                                          _listController.descriptionController.text = e.description;
                                          return ItemDialog(
                                            height: 200,
                                            titleTextController: _listController.titleController,
                                            descriptionTextController: _listController.descriptionController,
                                            onComplete: () {
                                              _listController.update(itemId: e.id).then((value) {
                                                _listController.fetchList().then((value) => Navigator.pop(context));
                                              });
                                            },
                                            completeButtonText: 'Edit',
                                          );
                                        });
                                  },
                                  onTapDelete: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        child: Container(
                                          padding: const EdgeInsets.all(16),
                                          height: 100,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Are you sure you want to delete this item?',
                                                style: TextStyle(
                                                  fontFamily: 'Oswald',
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  _listController.delete(itemId: e.id).then(
                                                        (value) => _listController
                                                            .fetchList()
                                                            .then((value) => Navigator.pop(context)),
                                                      );
                                                },
                                                child: const Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontFamily: 'Oswald',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                              .toList()
                          : [
                              const LoadingTile(margin: EdgeInsets.all(16)),
                              const LoadingTile(margin: EdgeInsets.all(16)),
                              const LoadingTile(margin: EdgeInsets.all(16)),
                            ],
                    );
                  }),
            );
          }),
    );
  }
}
