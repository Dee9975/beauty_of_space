import 'package:json_annotation/json_annotation.dart';

part 'picture.g.dart';

@JsonSerializable()
class Picture {
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  Picture({
    this.date = "",
    this.explanation = "",
    this.hdurl = "",
    this.mediaType = "",
    this.serviceVersion = "",
    this.title = "",
    this.url = "",
  });

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);

  Map<String, dynamic> toJson() => _$PictureToJson(this);

  @override
  String toString() =>
      """Picture(date: $date, explanation: $explanation, hdurl: $hdurl, title: $title, url: $url)""";
}
