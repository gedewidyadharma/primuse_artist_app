

import 'package:get/get.dart';

import '../../home/home.dart';

class BookingArtistAvailableListController extends GetxController {
  var selectedCountry = Rxn<FilterSearch>();

    final country = [
    FilterSearch(id: 'jkt', name: 'China'),
    FilterSearch(id: 'sgpr', name: 'Hongkong'),
    FilterSearch(id: 'bal', name: 'India'),
    FilterSearch(id: 'kllp', name: 'Indonesia'),
    FilterSearch(id: 'kllp', name: 'Japan'),
    FilterSearch(id: 'kllp', name: 'Macao'),
  ];




    void setCoutry(FilterSearch? data) {
    selectedCountry.value = data;
    // Tambahkan logika filter disini
  }
}