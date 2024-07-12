import 'package:flutter_itunes/api/itunes/repository_itunes.dart';
import 'package:flutter_itunes/enums/sorting.dart';
import 'package:flutter_itunes/model/song/song.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  final state = ListState();
  final ItunesRepository itunesRepository = ItunesRepository();

  @override
  void onInit() {
    super.onInit();
    fetchList();
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
    } finally {}

    state.loading.value = false;
  }

  /*
   * search list
   */
  void searchSong(String query) {
    state.search.value = query;
    processList();
  }

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
}
