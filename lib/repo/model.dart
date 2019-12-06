import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Busstop {
  Busstop();

  @JsonKey(name: '@id')
  String id;
  @JsonKey(name: 'dc:title')
  String title;
  @JsonKey(name: 'geo:lat')
  double lat;
  @JsonKey(name: 'geo:long')
  double long;
  @JsonKey(name: 'owl:sameAs')
  String timetable;

  factory Busstop.fromJson(Map<String, dynamic> json) =>
      _$BusstopFromJson(json);
  Map<String, dynamic> toJson() => _$BusstopToJson(this);
}

@JsonSerializable()
class Timetable {
  Timetable();

  @JsonKey(name: '@id')
  String id;
  @JsonKey(name: 'dc:title')
  String title;
  @JsonKey(name: 'odpt:busstopPoleTimetableObject')
  List<TimetableEntry> entries;

  factory Timetable.fromJson(Map<String, dynamic> json) =>
      _$TimetableFromJson(json);
  Map<String, dynamic> toJson() => _$TimetableToJson(this);
}

@JsonSerializable()
class TimetableEntry {
  TimetableEntry();

  @JsonKey(name: 'odpt:departureTime')
  String time;
  @JsonKey(name: 'odpt:destinationSign')
  String sign;

  factory TimetableEntry.fromJson(Map<String, dynamic> json) =>
      _$TimetableEntryFromJson(json);
  Map<String, dynamic> toJson() => _$TimetableEntryToJson(this);
}
