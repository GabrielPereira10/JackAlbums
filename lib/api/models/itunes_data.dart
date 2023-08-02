import 'package:jack_albums/api/models/result_data.dart';

class ItunesData {
  int? resultCount;
  List<ResultData>? results;

  ItunesData(this.resultCount, this.results);

  factory ItunesData.fromJson(Map<String, dynamic> json) {
    final resultCount = json['resultCount'];
    final results = (json['results'] as List?)
        ?.map((element) => ResultData.fromJson(element as Map<String, dynamic>))
        .toList();
    return ItunesData(resultCount, results);
  }
}
