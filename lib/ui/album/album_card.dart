import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jack_albums/main.dart';
import 'package:jack_albums/ui/album/models/album.dart';

class AlbumCard extends ConsumerWidget {
  const AlbumCard({super.key, required this.album, this.isFavourite = false});

  final Album album;
  final bool isFavourite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (album.imageUrl != null)
            Image.network(
              album.imageUrl!,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null);
              },
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image, size: 100),
            ),
          Expanded(
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(album.collectionName ?? "",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 5),
                    Text(
                      album.price,
                      style: theme.textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
            ),
          ),
          IconFavouriteButton(
              color: Colors.red,
              isSelected: isFavourite,
              onTap: album.collectionId != null
                  ? () => ref
                      .read(albumsController.notifier)
                      .selectAlbum(album.collectionId!)
                  : null)
        ],
      ),
    );
  }
}

class IconFavouriteButton extends StatelessWidget {
  const IconFavouriteButton(
      {super.key, this.isSelected = false, this.onTap, this.color});

  final Function()? onTap;
  final bool isSelected;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      splashColor: color?.withOpacity(0.1),
      highlightColor: color?.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Icon(
          isSelected ? Icons.favorite : Icons.favorite_outline,
          color: color,
        ),
      ),
    );
  }
}
