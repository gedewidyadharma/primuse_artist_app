import 'package:get/get.dart';
import '../../../core/core.dart';
import '../models/models.dart';

class ArtistController extends GetxController {
  var artists = <Artist>[].obs;
  var isLoading = true.obs;
    var state = StateStatus.emtpy.obs;

  @override
  void onInit() {
    super.onInit();
    fetchArtists();
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