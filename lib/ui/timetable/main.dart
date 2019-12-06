import 'package:flutter/material.dart';

import '../../repo/api.dart';
import '../../repo/model.dart';

class TimetablePage extends StatefulWidget {
  TimetablePage(this.timetableId);
  final String timetableId;
  @override
  State<StatefulWidget> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  final _list = List<Timetable>();

  @override
  void initState() {
    super.initState();
    Api().listBusstopPoleTimetable(widget.timetableId).then((data) {
      setState(() {
        _list.addAll(data);
        _list.sort((a1, a2) => a1.title.compareTo(a2.title));
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: ListView.separated(
            separatorBuilder: (context, position) => Divider(
              color: Colors.black,
            ),
            itemCount: _list == null ? 0 : _list.length,
            itemBuilder: (context, position) => ListTile(
              title: Text(_list[position].title),
              subtitle: Text(_list[position].id),
            ),
          ),
        ),
      );
}
