import 'package:flutter/material.dart';
import 'package:flutter_itunes/view/list/controller/controller_list.dart';
import 'package:get/get.dart';

class List extends GetView<ListController> {
  const List({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Itues Search"),
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            await controller.fetchList();
          },
          child: SingleChildScrollView(
            child: Column(
              children: controller.state.list
                  .map((song) => ListTile(
                        title: Text(song.name),
                        subtitle: Text(song.artist),
                        leading: Image.network(song.collectionCover!),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
