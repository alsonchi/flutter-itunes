import 'package:flutter_itunes/model/song/song.dart';

abstract class IItunesRepository {
  Future<List<Song>> fetch();
}
