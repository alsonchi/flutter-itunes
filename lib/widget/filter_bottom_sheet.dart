import 'package:flutter/material.dart';
import 'package:flutter_itunes/config/dimens.dart';
import 'package:flutter_itunes/enums/sorting.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingSmall,
          vertical: AppDimens.paddingLarger),
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(Get.context!).size.width,
        maxHeight: MediaQuery.of(Get.context!).size.height * 0.90,
        minHeight: 0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(AppDimens.radiusLarge),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.paddingSmall),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: Sorting.values
              .map(
                (sorting) => ListTile(
                  leading: Icon(sorting.icon),
                  onTap: () => Get.back(result: sorting),
                  title: Text(sorting.label),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
