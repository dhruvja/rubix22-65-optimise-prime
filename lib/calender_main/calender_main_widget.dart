import 'package:lottie/lottie.dart';
import 'package:makirasoii2/components/empty.dart';
import 'package:makirasoii2/components/stat_widget.dart';

import '../components/calender_widget.dart';
import '../components/lists2_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class CalenderMainWidget extends StatefulWidget {
  const CalenderMainWidget({Key key}) : super(key: key);

  @override
  _CalenderMainWidgetState createState() => _CalenderMainWidgetState();
}

class _CalenderMainWidgetState extends State<CalenderMainWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Map<DateTime, List<dynamic>> selectedEvents;
  var items;
  bool present = false;

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  List<dynamic> getEventsFromToday(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  void initState() {
    selectedEvents = {};
    super.initState();
    getData();
  }

  // void addEvent(){
  //   print(selectedDay);
  //   if(selectedEvents[selectedDay] != null)
  //     selectedEvents[selectedDay].add("Hey");
  //   else
  //     selectedEvents[selectedDay] = ["hey"];
  // }

  void getData() async {
    try {
      String url = "http://192.168.0.192:5000/" + "api/getitem";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        var data = json.decode(response.body);
        // print(data);
        setState(() {
          items = data;
          present = true;
        });
        data.forEach((each) {
          try {
            var date = DateTime.parse(each['expiry_date'] + "Z");
            if (selectedEvents[date] != null)
              selectedEvents[date].add(each);
            else
              selectedEvents[date] = [each];
            // print(selectedEvents);
          } catch (e) {
            print(e);
          }
        });
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('No Interent Found, try again'),
            backgroundColor: Colors.redAccent),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.615,
                      decoration: BoxDecoration(
                        color: Color(0xFFB4DFF5),
                      ),
                      child: TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: focusedDay,
                        onDaySelected: (_selectedDay, _focusedDay) {
                          setState(() {
                            selectedDay = _selectedDay;
                            focusedDay = _focusedDay;
                          });
                        },
                        selectedDayPredicate: (day) {
                          return isSameDay(selectedDay, day);
                        },
                        eventLoader: getEventsFromToday,
                      )),
                  // CalenderWidget(selectedEvents[selectedDay][0]),
                  // CalenderWidget(),
                  // ElevatedButton(onPressed: addEvent, child: Text("addEvent")),
                  if (getEventsFromToday(selectedDay).length == 0)
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                      ),
                      child: Lottie.asset(
                        'assets/lottie_animations/box1.json',
                        fit: BoxFit.cover,
                        repeat: true,
                      ),
                    ),

                  ...getEventsFromToday(selectedDay).map((e) {
                    return CalenderWidget(e);
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
