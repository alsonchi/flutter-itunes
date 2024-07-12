class Song {
  final int trackId;
  final int collectionId;
  final String artist;
  final String collection;
  final String? collectionCover;
  final String name;
  final String? previewUrl;

  Song(
      {required this.trackId,
      required this.collectionId,
      required this.artist,
      required this.collection,
      this.collectionCover,
      required this.name,
      this.previewUrl});

  static Song get NULL => Song(
        trackId: 0,
        collectionId: 0,
        artist: '',
        collection: '',
        name: '',
      );

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      trackId: json['trackId'],
      collectionId: json['collectionId'],
      artist: json['artistName'],
      collection: json['collectionName'],
      collectionCover: json['artworkUrl100'],
      name: json['trackName'],
      previewUrl: json['previewUrl'],
    );
  }
}
