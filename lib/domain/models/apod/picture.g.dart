// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Picture _$PictureFromJson(Map<String, dynamic> json) => Picture(
      date: json['date'] as String? ?? "",
      explanation: json['explanation'] as String? ?? "",
      hdurl: json['hdurl'] as String? ?? "",
      mediaType: json['mediaType'] as String? ?? "",
      serviceVersion: json['serviceVersion'] as String? ?? "",
      title: json['title'] as String? ?? "",
      url: json['url'] as String? ?? "",
    );

Map<String, dynamic> _$PictureToJson(Picture instance) => <String, dynamic>{
      'date': instance.date,
      'explanation': instance.explanation,
      'hdurl': instance.hdurl,
      'mediaType': instance.mediaType,
      'serviceVersion': instance.serviceVersion,
      'title': instance.title,
      'url': instance.url,
    };
