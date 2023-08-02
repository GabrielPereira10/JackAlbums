import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jack_albums/main.dart';
import 'package:jack_albums/ui/album/album_card.dart';

class ListAlbumsScreen extends ConsumerStatefulWidget {
  const ListAlbumsScreen({super.key});

  @override
  ConsumerState<ListAlbumsScreen> createState() => _ListAlbumsScreenState();
}

class _ListAlbumsScreenState extends ConsumerState<ListAlbumsScreen> {
  @override
  Widget build(BuildContext context) {
    final list = ref.watch(albumsController);
    if (list == null || list.albums == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final albums = list.albums!;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Jack's Albums"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              final album = albums[index];
              return AlbumCard(
                album: album,
                isFavourite: list.favouriteAlbums.contains(album.collectionId),
              );
            },
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Container(
                color: Colors.grey.withOpacity(0.2),
                height: 1,
              ),
            ),
            itemCount: albums.length,
          ),
        ),
      ),
    );
  }
}
