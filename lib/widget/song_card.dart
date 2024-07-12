import 'package:flutter/material.dart';
import 'package:flutter_itunes/config/dimens.dart';
import 'package:flutter_itunes/config/text.dart';
import 'package:flutter_itunes/model/song/song.dart';
import 'package:flutter_itunes/widget/shimmer_loading.dart';
import 'package:just_audio/just_audio.dart';

class SongCard extends StatelessWidget {
  final Song? song;
  final bool loading;
  final Function? playCallback;

  const SongCard({
    this.song,
    this.loading = false,
    this.playCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (song == null && !loading) return Container();

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
            child: !loading
                ? Image.network(
                    song!.collectionCover!,
                    width: 80,
                    height: 80,
                  )
                : const ShimmerLoading(width: 80, height: 80),
          ),
          const SizedBox(width: AppDimens.marginTiny),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: AppDimens.paddingTiny),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  !loading
                      ? Text(
                          song!.name,
                          style: AppTextStyles.body.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      : const ShimmerLoading(height: 32),
                  const SizedBox(height: AppDimens.paddingTiny),
                  !loading
                      ? Text(
                          song!.collection,
                          style: AppTextStyles.bodySmall
                              .copyWith(color: Colors.grey.shade600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      : const ShimmerLoading(height: 14),
                ],
              ),
            ),
          ),
          const SizedBox(width: AppDimens.marginTiny),
          SizedBox(
            height: 80,
            child: Center(
              child: !loading
                  ? IconButton(
                      onPressed: () =>
                          playCallback != null ? playCallback!() : null,
                      icon:
                          Icon(Icons.play_circle, color: Colors.grey.shade400),
                    )
                  : const ShimmerLoading(
                      width: 30,
                      height: 30,
                    ),
            ),
          ),
          const SizedBox(width: AppDimens.marginTiny),
        ],
      ),
    );
  }
}
