// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Busstop _$BusstopFromJson(Map<String, dynamic> json) {
  return Busstop()
    ..id = json['@id'] as String
    ..title = json['dc:title'] as String
    ..lat = (json['geo:lat'] as num)?.toDouble()
    ..long = (json['geo:long'] as num)?.toDouble();
}

Map<String, dynamic> _$BusstopToJson(Busstop instance) => <String, dynamic>{
      '@id': instance.id,
      'dc:title': instance.title,
      'geo:lat': instance.lat,
      'geo:long': instance.long
    };
