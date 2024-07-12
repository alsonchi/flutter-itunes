import 'package:flutter/material.dart';

enum Sorting { songAsc, songDesc, albumAsc, albumDesc }

extension SortingExtension on Sorting {
  String get label {
    switch (this) {
      case Sorting.songAsc:
        return "Song Asc";
      case Sorting.songDesc:
        return "Song Desc";
      case Sorting.albumAsc:
        return "Album Asc";
      case Sorting.albumDesc:
        return "Album Desc";
    }
  }

  IconData get icon {
    switch (this) {
      case Sorting.songAsc:
        return Icons.arrow_upward_rounded;
      case Sorting.songDesc:
        return Icons.arrow_downward;
      case Sorting.albumAsc:
        return Icons.arrow_upward;
      case Sorting.albumDesc:
        return Icons.arrow_downward;
    }
  }
}
