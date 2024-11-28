import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../artist_details.dart';

class ArtistDetailsPage extends GetView<ArtistDetailsController> {
  const ArtistDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text("ArtisName"),
        backgroundColor: Colors.white,
      ),
      body: _Body(),
    );
  }
}

class _Body extends GetView<ArtistDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
