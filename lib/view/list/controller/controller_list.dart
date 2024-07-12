import 'package:flutter/material.dart';
import 'package:flutter_itunes/api/itunes/repository_itunes.dart';
import 'package:flutter_itunes/enums/sorting.dart';
import 'package:flutter_itunes/model/song/song.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class ListController extends GetxController {
  final state = ListState();
  final ItunesRepository itunesRepository = ItunesRepository();
  final player = AudioPlayer();

  @override
  void onInit() {
    super.onInit();
    fetchList();
    player.playbackEventStream.listen((event) {
      if (event.processingState == ProcessingState.completed) {
        playerStop();
      }
    });
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }

  /*
   * filter & reorder list
   */
  void processList() {
    List<Song> list = state.orgList
        .where((element) =>
            element.name
                .toLowerCase()
                .contains(state.search.value.toLowerCase()) ||
            element.collection
                .toLowerCase()
                .contains(state.search.value.toLowerCase()))
        .toList();

    switch (state.sortby.value) {
      case Sorting.songDesc:
        list.sort(
            (a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()));
        break;
      case Sorting.albumAsc:
        list.sort((a, b) =>
            a.collection.toLowerCase().compareTo(b.collection.toLowerCase()));
        break;
      case Sorting.albumDesc:
        list.sort((a, b) =>
            b.collection.toLowerCase().compareTo(a.collection.toLowerCase()));
        break;
      default:
        list.sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }

    state.list.value = list;
  }

  /*
   * fetch list  
   */
  Future<void> fetchList() async {
    try {
      state.loading.value = true;
      state.orgList.value = await itunesRepository.fetch();
      processList();
      state.loading.value = false;
    } catch (e) {
      Get.dialog(
        AlertDialog(
          title: const Text('Faild to fetch list'),
          content:
              const Text('Please check your internet connection and try again'),
          actions: [
            TextButton(
              child: const Text("Retry"),
              onPressed: () {
                Get.back();
                fetchList();
              },
            ),
          ],
        ),
        barrierDismissible: false,
      );
    }
  }

  /*
   * search list
   */
  void searchSong(String query) {
    state.search.value = query;
    processList();
  }

  /*
   * play song
   */
  void playerPlay(Song song) async {
    if (song.previewUrl == null) {
      return;
    }

    state.playSong.value = song;

    final duration = await player.setUrl(song.previewUrl!);
    state.playerPlay.value = true;

    if (duration != null) {
      state.playSongDuration.value = duration;
      player.play();
    }
  }

  /*
   * play pause
   */
  void playerPause() async {
    state.playerPlay.value = false;
    player.pause();
  }

  /*
   * play stop
   */
  void playerStop() async {
    state.playerPlay.value = false;
    state.playSong.value = Song.NULL;
    player.stop();
  }

  /*
   * play resume
   */
  void playerResume() async {
    state.playerPlay.value = true;
    player.play();
  }

  /*
   * set sort 
   */
  void sortby(Sorting? sorting) {
    if (state.sortby.value == sorting || sorting == null) return;

    state.sortby.value = sorting;
    processList();
  }
}

class ListState {
  RxBool loading = true.obs;
  RxList<Song> orgList = List<Song>.empty().obs;
  RxList<Song> list = List<Song>.empty().obs;
  RxString search = ''.obs;
  Rx<Sorting> sortby = Sorting.songAsc.obs;

  Rx<Song> playSong = Song.NULL.obs;
  RxBool playerPlay = false.obs;
  Rx<Duration> playSongDuration = Duration.zero.obs;
}
