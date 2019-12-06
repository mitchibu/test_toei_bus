import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:page_transition/page_transition.dart';

import '../../repo/api.dart';
import '../../repo/model.dart';
import '../../ui/timetable/main.dart';

class MapSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  static const _kInitialZoom = 16.0;
  static const _kInitialPosition = LatLng(35.681236, 139.767125);
  static const _kDistance = 1000;

  final _location = Location();
  final _api = Api();
  final _map = Map<String, Busstop>();

  bool enableLocation = false;
  GoogleMapController _controller;
  LatLng _position = _kInitialPosition;

  @override
  void initState() {
    super.initState();
    _location.requestPermission().then((data) {
      setState(() {
        enableLocation = data;
        if (data) {
          _location.getLocation().then((data) {
            _controller
                .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(data.latitude, data.longitude),
              zoom: _kInitialZoom,
            )));
          });
        } else {
          _updateBusstopPole(_kInitialPosition);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: GoogleMap(
            myLocationEnabled: enableLocation,
            onMapCreated: (controller) {
              _controller = controller;
            },
            onCameraMove: (position) {
              _position = position.target;
            },
            onCameraIdle: () {
              if (_position != null) {
                _updateBusstopPole(_position);
              }
            },
            initialCameraPosition: CameraPosition(
              target: _position,
              zoom: _kInitialZoom,
            ),
            markers: _map == null
                ? null
                : _map.values
                    .map((m) => Marker(
                          markerId: MarkerId(m.id),
                          position: LatLng(m.lat, m.long),
                          infoWindow: InfoWindow(
                            title: m.title,
                            //snippet: office.address,
                            onTap: () {
                              Navigator.of(context).push<dynamic>(
                                PageTransition<dynamic>(
                                  type: PageTransitionType.downToUp,
                                  child: TimetablePage(m.timetable),
                                ),
                              );
                            },
                          ),
                        ))
                    .toSet(),
          ),
        ),
      );

  void _updateBusstopPole(LatLng latLng) {
    _api
        .listBusstopPole(latLng.latitude, latLng.longitude, _kDistance)
        .then((data) {
      setState(() {
        data.forEach((busstop) {
          _map[busstop.id] = busstop;
        });
      });
    });
  }
}
