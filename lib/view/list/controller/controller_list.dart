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
   * fetch list  
   */
  Future<void> fetchList() async {
    try {
      state.loading.value = true;
      state.list.value = await itunesRepository.fetch();
    } finally {}

    state.loading.value = false;
  }
}

class ListState {
  RxBool loading = true.obs;
  RxList<Song> list = List<Song>.empty().obs;
  RxString search = ''.obs;
  Rx<Sorting> sortby = Sorting.songAsc.obs;
}
