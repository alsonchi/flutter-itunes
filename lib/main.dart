import 'package:flutter/material.dart';
import 'package:flutter_itunes/view/list/controller/controller_list.dart';
import 'package:flutter_itunes/view/list/list.dart';
import 'package:get/get.dart';

void main() async {
  /**
   * Rodo: init flavor
   */
  const appLoad = AppLoad();
  await appLoad.init();
  runApp(appLoad);
}

class AppLoad extends StatefulWidget {
  const AppLoad({super.key});

  Future<void> init() async {
    Get.lazyPut<ListController>(() => ListController(), fenix: true);
  }

  @override
  State<StatefulWidget> createState() {
    return _AppLoadState();
  }
}

class _AppLoadState extends State<AppLoad> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SongList(),
    );
  }
}
