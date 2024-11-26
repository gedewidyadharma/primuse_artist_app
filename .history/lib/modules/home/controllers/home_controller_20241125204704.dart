import 'package:get/get.dart';

import '../../modules.dart';

class HomeController extends GetxController {
  var selectedCategory = Rxn<FilterSearch>();
  var selectedCity = Rxn<FilterSearch>();
  

  final categories = [
    FilterSearch(id: 'international', name: 'International'),
    FilterSearch(id: 'national', name: 'Domestic'),
  ];

  final city = [
    FilterSearch(id: 'jkt', name: 'Jakarta'),
    FilterSearch(id: 'sgpr', name: 'Singapore'),
    FilterSearch(id: 'bal', name: 'Bali'),
    FilterSearch(id: 'kllp', name: 'Kuala Lumpur'),
  ];

  var artists = <Artist>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchArtists();
  }

  initData(){
    setCategory(categories[0]);
     setCity(city[0]);
  }

  void setCategory(FilterSearch? category) {
    selectedCategory.value = category;
    // Tambahkan logika filter disini
  }

  void setCity(FilterSearch? city) {
    selectedCity.value = city;
    // Tambahkan logika filter disini
  }

  void fetchArtists() {
    try {
      isLoading(true);
      artists.value = [
        Artist(
          rank: 1,
          name: 'Taylor Swift',
          imageUrl: 'https://files.kisum.io/artists/1361541.jpg',
          country: 'US',
          genres: ['Country', 'Pop', 'Female Vocalists'],
          currentListeners: 690.5,
          peakListeners: 965.1,
        ),
        Artist(
          rank: 1,
          name: 'Taylor Swift',
          imageUrl: 'https://files.kisum.io/artists/1361541.jpg',
          country: 'US',
          genres: ['Country', 'Pop', 'Female Vocalists'],
          currentListeners: 690.5,
          peakListeners: 965.1,
        ),
        Artist(
          rank: 1,
          name: 'Taylor Swift',
          imageUrl: 'https://files.kisum.io/artists/1361541.jpg',
          country: 'US',
          genres: ['Country', 'Pop', 'Female Vocalists'],
          currentListeners: 690.5,
          peakListeners: 965.1,
        ),
        Artist(
          rank: 1,
          name: 'Taylor Swift',
          imageUrl: 'https://files.kisum.io/artists/1361541.jpg',
          country: 'US',
          genres: ['Country', 'Pop', 'Female Vocalists'],
          currentListeners: 690.5,
          peakListeners: 965.1,
        ),
        Artist(
          rank: 1,
          name: 'Taylor Swift',
          imageUrl: 'https://files.kisum.io/artists/1361541.jpg',
          country: 'US',
          genres: ['Country', 'Pop', 'Female Vocalists'],
          currentListeners: 690.5,
          peakListeners: 965.1,
        ),
        Artist(
          rank: 1,
          name: 'Taylor Swift',
          imageUrl: 'https://files.kisum.io/artists/1361541.jpg',
          country: 'US',
          genres: ['Country', 'Pop', 'Female Vocalists'],
          currentListeners: 690.5,
          peakListeners: 965.1,
        ),
        Artist(
          rank: 1,
          name: 'Taylor Swift',
          imageUrl: 'https://files.kisum.io/artists/1361541.jpg',
          country: 'US',
          genres: ['Country', 'Pop', 'Female Vocalists'],
          currentListeners: 690.5,
          peakListeners: 965.1,
        ),
        Artist(
          rank: 1,
          name: 'Taylor Swift',
          imageUrl: 'https://files.kisum.io/artists/1361541.jpg',
          country: 'US',
          genres: ['Country', 'Pop', 'Female Vocalists'],
          currentListeners: 690.5,
          peakListeners: 965.1,
        ),
        Artist(
          rank: 1,
          name: 'Taylor Swift',
          imageUrl: 'https://files.kisum.io/artists/1361541.jpg',
          country: 'US',
          genres: ['Country', 'Pop', 'Female Vocalists'],
          currentListeners: 690.5,
          peakListeners: 965.1,
        ),
        Artist(
          rank: 1,
          name: 'Taylor Swift',
          imageUrl: 'https://files.kisum.io/artists/1361541.jpg',
          country: 'US',
          genres: ['Country', 'Pop', 'Female Vocalists'],
          currentListeners: 690.5,
          peakListeners: 965.1,
        ),
        Artist(
          rank: 1,
          name: 'Taylor Swift',
          imageUrl: 'https://files.kisum.io/artists/1361541.jpg',
          country: 'US',
          genres: ['Country', 'Pop', 'Female Vocalists'],
          currentListeners: 690.5,
          peakListeners: 965.1,
        ),
        Artist(
          rank: 1,
          name: 'Taylor Swift',
          imageUrl: 'https://files.kisum.io/artists/1361541.jpg',
          country: 'US',
          genres: ['Country', 'Pop', 'Female Vocalists'],
          currentListeners: 690.5,
          peakListeners: 965.1,
        ),
        Artist(
          rank: 1,
          name: 'Taylor Swift',
          imageUrl: 'https://files.kisum.io/artists/1361541.jpg',
          country: 'US',
          genres: ['Country', 'Pop', 'Female Vocalists'],
          currentListeners: 690.5,
          peakListeners: 965.1,
        ),
      ];
    } finally {
      isLoading(false);
    }
  }
}
