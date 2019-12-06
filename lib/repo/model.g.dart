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
    ..long = (json['geo:long'] as num)?.toDouble()
    ..timetable = json['owl:sameAs'] as String;
}

Map<String, dynamic> _$BusstopToJson(Busstop instance) => <String, dynamic>{
      '@id': instance.id,
      'dc:title': instance.title,
      'geo:lat': instance.lat,
      'geo:long': instance.long,
      'owl:sameAs': instance.timetable
    };

Timetable _$TimetableFromJson(Map<String, dynamic> json) {
  return Timetable()
    ..id = json['@id'] as String
    ..title = json['dc:title'] as String
    ..entries = (json['odpt:busstopPoleTimetableObject'] as List)
        ?.map((e) => e == null
            ? null
            : TimetableEntry.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TimetableToJson(Timetable instance) => <String, dynamic>{
      '@id': instance.id,
      'dc:title': instance.title,
      'odpt:busstopPoleTimetableObject': instance.entries
    };

TimetableEntry _$TimetableEntryFromJson(Map<String, dynamic> json) {
  return TimetableEntry()
    ..time = json['odpt:departureTime'] as String
    ..sign = json['odpt:destinationSign'] as String;
}

Map<String, dynamic> _$TimetableEntryToJson(TimetableEntry instance) =>
    <String, dynamic>{
      'odpt:departureTime': instance.time,
      'odpt:destinationSign': instance.sign
    };
