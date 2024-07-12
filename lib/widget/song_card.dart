import 'package:flutter/material.dart';
import 'package:flutter_itunes/config/dimens.dart';
import 'package:flutter_itunes/config/text.dart';
import 'package:flutter_itunes/model/song/song.dart';

class SongCard extends StatelessWidget {
  final Song song;

  const SongCard(
    this.song, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimens.radiusSmall),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: AppDimens.radiusSmaller,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppDimens.radiusSmall),
                bottomLeft: Radius.circular(AppDimens.radiusSmall)),
            child: Image.network(
              song.collectionCover!,
              width: 80,
              height: 80,
            ),
          ),
          const SizedBox(width: AppDimens.marginTiny),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: AppDimens.paddingTiny),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.name,
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    song.collection,
                    style: AppTextStyles.bodySmall
                        .copyWith(color: Colors.grey.shade600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: AppDimens.marginTiny),
          SizedBox(
            height: 80,
            child: IconButton(
              onPressed: () => {},
              icon: Icon(Icons.play_circle, color: Colors.grey.shade400),
            ),
          ),
        ],
      ),
    );
  }
}
