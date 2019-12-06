import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../repo/api.dart';
import '../../repo/model.dart';

class TimetablePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  List<Timetable> _list;
  List<TimetableEntry> _entries;
  final _timetable = Map<String, List<String>>();

  @override
  void initState() {
    super.initState();
    Api()
        .listBusstopPoleTimetable('odpt.BusstopPole:Toei.ToritsuSansho.1050.1')
        .then((data) {
      setState(() {
        _list = data;
        _entries = data[0].entries;
        _entries.forEach((data) {
          final time = data.time.split(':');
          var list = _timetable[time[0]];
          if (list == null) {
            _timetable[time[0]] = list = List<String>();
          }
          list.add(time[1]);
        });
        print('_timetable: ${_timetable.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            _list == null ? '' : _list[0].title,
            softWrap: true,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: ListView.separated(
            separatorBuilder: (context, position) => Divider(
              color: Colors.black,
            ),
            itemCount: _timetable == null ? 0 : _timetable.length,
            itemBuilder: (context, position) {
              final hour = _timetable.keys.toList()[position];
              return Container(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(hour),
                    ),
                    Expanded(
                      child: Wrap(
                        children: _timetable[hour]
                            .map((m) => Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(m),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
}
