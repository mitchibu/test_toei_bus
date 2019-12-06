import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

class Api {
  static final token =
      'f980b9f6b4a4d67d869c90ea574064c42d4f4690215df76e062b1322579a3b3e';
  static final operator = 'odpt.Operator:Toei';

  Future<List<Busstop>> listBusstopPole(
      double lat, double lng, int distance) async {
    // final lat = 35.642026;
    // final lng = 139.796036;
    // final response = await http.get(
    //     'https://api.odpt.org/api/v4/odpt:BusstopPole?odpt:operator=$operator&acl:consumerKey=$token');
    final response = await http.get(
        'https://api.odpt.org/api/v4/places/odpt:BusstopPole?lon=$lng&lat=$lat&radius=$distance&acl:consumerKey=$token&odpt:operator=$operator');
    if (response.statusCode == 200) {
      List<Busstop> list = [];
      List<dynamic> decoded = json.decode(response.body);
      decoded.forEach((m) {
        list.add(Busstop.fromJson(m));
      });
      return list;
    } else {
      throw Exception('Fail to search repository');
    }
  }

  Future<List<Timetable>> listBusstopPoleTimetable(String id) async {
    final response = await http.get(
        'https://api.odpt.org/api/v4/odpt:BusstopPoleTimetable?odpt:operator=$operator&acl:consumerKey=$token&odpt:busstopPole=$id');
    if (response.statusCode == 200) {
      List<Timetable> list = [];
      List<dynamic> decoded = json.decode(response.body);
      decoded.forEach((m) {
        list.add(Timetable.fromJson(m));
      });
      return list;
    } else {
      throw Exception('Fail to search repository');
    }
  }
}
