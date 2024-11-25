class Artist {
  final int rank;
  final String name;
  final String imageUrl;
  final String country;
  final List<String> genres;
  final double currentListeners;
  final double peakListeners;

  Artist({
    required this.rank,
    required this.name,
    required this.imageUrl,
    required this.country,
    required this.genres,
    required this.currentListeners,
    required this.peakListeners,
  });
}