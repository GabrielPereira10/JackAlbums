import 'package:jack_albums/ui/album/models/album.dart';

class ResultData {
  String? wrapperType;

  ResultData(this.wrapperType);

  factory ResultData.fromJson(Map<String, dynamic> json) {
    final wrapperType = json['wrapperType'];
    switch (wrapperType) {
      case Album.type:
        return Album.fromJson(json);
      default:
        return ResultData(wrapperType);
    }
  }
}
