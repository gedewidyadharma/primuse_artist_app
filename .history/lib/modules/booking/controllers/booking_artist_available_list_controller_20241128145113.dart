import 'package:get/get.dart';

import '../../home/home.dart';
import '../../modules.dart';

class BookingArtistAvailableListController extends GetxController {
  var selectedCountry = Rxn<FilterSearch>();

   var artists = <Artist>[].obs;
  var isLoading = true.obs;

  final country = [
    FilterSearch(id: 'all', name: 'All'),
    FilterSearch(id: 'jkt', name: 'China'),
    FilterSearch(id: 'sgpr', name: 'Hongkong'),
    FilterSearch(id: 'bal', name: 'India'),
    FilterSearch(id: 'kllp', name: 'Indonesia'),
    FilterSearch(id: 'kllp', name: 'Japan'),
    FilterSearch(id: 'kllp', name: 'Macao'),
  ];

    @override
  void onInit() {
    super.onInit();
    fetchArtists();
    initData();
  }

  initData(){
    setCoutry(country[0]);
  }


  

  void setCoutry(FilterSearch? data) {
    selectedCountry.value = data;
    // Tambahkan logika filter disini
  }

  void fetchArtists() {
    try {
      isLoading(true);
      artists.value = [
      
      ];
    } finally {
      isLoading(false);
    }
  }
}
