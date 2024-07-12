import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_itunes/config/config.dart';
import 'package:flutter_itunes/config/dimens.dart';
import 'package:flutter_itunes/config/text.dart';
import 'package:flutter_itunes/view/list/controller/controller_list.dart';
import 'package:flutter_itunes/widget/search_field.dart';
import 'package:get/get.dart';

class List extends GetView<ListController> {
  late ScrollController scrollController;
  RxDouble progress = 1.0.obs;
  final double expandedHeight = 110;
  final double collapsedHeight = 56;

  List({super.key});

  @override
  Widget build(BuildContext context) {
    scrollController = ScrollController()
      ..addListener(() {
        progress.value = min(
            1,
            max(
                0,
                1 -
                    (max(scrollController.offset, 0) /
                        (expandedHeight - collapsedHeight))));
      });

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          appbar(),
          SliverList(delegate: SliverChildListDelegate([list()]))
        ],
      ),
    );
  }

  Widget appbar() {
    return Obx(
      () => SliverAppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        pinned: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        expandedHeight: expandedHeight,
        collapsedHeight: collapsedHeight,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(
            top: kToolbarHeight,
            left: AppDimens.paddingSmall,
            right: AppDimens.paddingSmall,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(),
              SizedBox(height: AppDimens.marginSmaller * progress.value),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SearchField(
                        onChanged: (value) {
                          print(value);
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    String singer = AppConfig.singer.replaceAll("+", " ");

    return SizedBox(
      height: 40 * progress.value,
      width: double.infinity,
      child: OverflowBox(
        minHeight: 40,
        maxHeight: 40,
        child: Opacity(
          opacity: progress.value,
          child: Text(
            singer,
            style: AppTextStyles.headingXL,
          ),
        ),
      ),
    );
  }

  Widget list() {
    return Obx(
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
    );
  }
}
