import 'package:jack_albums/api/models/result_data.dart';

class Album extends ResultData {
  int? collectionId;
  int? artistId;
  String? collectionType;
  String? imageUrl;
  String? collectionName;
  String? currency;
  double? collectionPrice;

  static const String type = "collection";

  Album(super.wrapperType);

  factory Album.fromJson(Map<String, dynamic> json) {
    final album = Album(json['wrapperType']);
    album.collectionType = json['collectionType'];
    album.artistId = json['artistId'];
    album.collectionId = json['collectionId'];
    album.imageUrl = json['artworkUrl100'];
    album.collectionName = json['collectionName'];
    album.currency = json['currency'];
    album.collectionPrice = json['collectionPrice'];
    return album;
  }

  String get price => collectionPrice != null
      ? '${currency ?? ''} $collectionPrice'
      : 'Price not available';
}
