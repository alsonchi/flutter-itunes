enum Sorting { songAsc, songDesc, albumAsc, albumDesc }

extension SortingExtension on Sorting {
  String get label {
    switch (this) {
      case Sorting.songAsc:
        return "Song";
      case Sorting.songDesc:
        return "Song";
      case Sorting.albumAsc:
        return "Album";
      case Sorting.albumDesc:
        return "Album";
    }
  }
}
