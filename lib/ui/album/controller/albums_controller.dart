import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jack_albums/api/models/itunes_data.dart';
import 'package:jack_albums/ui/album/models/album.dart';
import 'package:http/http.dart' as http;
import 'package:jack_albums/ui/album/models/albums_data.dart';

class AlbumsController extends StateNotifier<AlbumsData?> {
  AlbumsController() : super(null) {
    reloadAlbumsData();
  }

  void reloadAlbumsData() async {
    final jsonMap = json.decode(await http.read(
        Uri.parse('https://itunes.apple.com/lookup?id=909253&entity=album')));
    final data = ItunesData.fromJson(jsonMap as Map<String, dynamic>);
    final albums = data.results?.whereType<Album>().toList();
    state = AlbumsData(albums ?? []);
  }

  void selectAlbum(int collectionId) {
    final favourites = List<int>.from(state?.favouriteAlbums ?? []);
    if (favourites.contains(collectionId)) {
      favourites.remove(collectionId);
    } else {
      favourites.add(collectionId);
    }
    state = state?.copyWith(favouriteAlbums: favourites);
  }
}
