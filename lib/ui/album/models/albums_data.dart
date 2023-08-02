import 'package:jack_albums/ui/album/models/album.dart';

class AlbumsData {
  List<Album>? albums;
  List<int> favouriteAlbums = [];

  AlbumsData(this.albums);

  AlbumsData copyWith({List<int>? favouriteAlbums}) {
    final copy = AlbumsData(albums);
    copy.favouriteAlbums = favouriteAlbums ?? this.favouriteAlbums;
    return copy;
  }
}
