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

  factory Busstop.fromJson(Map<String, dynamic> json) =>
      _$BusstopFromJson(json);
  Map<String, dynamic> toJson() => _$BusstopToJson(this);
}
