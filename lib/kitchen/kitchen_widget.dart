import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:makirasoii2/scan1/scan1_widget.dart';

import '../components/lists1_widget.dart';
import '../components/stat_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class KitchenWidget extends StatefulWidget {
  const KitchenWidget({Key key}) : super(key: key);

  @override
  _KitchenWidgetState createState() => _KitchenWidgetState();
}

class _KitchenWidgetState extends State<KitchenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var items;
  var thisWeek = [];
  var nextWeek = [];
  var later = [];
  bool present = false;

  void initState(){
    super.initState();
    getItems();
  }

  void getItems() async{
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
        var today = DateTime.now();
        today = today.add(Duration(days: 7));
        var next = DateTime.now();
        next = next.add(Duration(days: 14));
        data.forEach((each) {
          if(each['expiry_date'].compareTo(today.toString()) == -1){
            if(thisWeek != null)
              thisWeek.add(each);
            else
              thisWeek[0] = each;
          }
          else if(each['expiry_date'].compareTo(next.toString()) == -1){
            if(nextWeek != null)
              nextWeek.add(each);
            else
              nextWeek[0] = each;
          }
          else{
            if(later != null)
              later.add(each);
            else
              later[0] = each;
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

  // void LocalNotification() {

  // static void initialize(context) {
  //   final InitializationSettings initializationSettings =
  //       InitializationSettings(
  //           android: AndroidInitializationSettings("@mipmap/ic_launcher"));

  //   // _notificationPlugin.initialize(initializationSettings,
  //   //     onSelectNotification: (String route) async {
  //   //   if (route != null) {
  //   //     Navigator.of(context).pushNamed(route);
  //   //   }
  //   // });
  // }

  void sendNotifs() async {
    try {
      final FlutterLocalNotificationsPlugin _notificationPlugin =
      FlutterLocalNotificationsPlugin();

      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails("jobista", "jobista channel",
              importance: Importance.max, priority: Priority.max));
      await _notificationPlugin.show(id, "yo bro",
          "wassup", notificationDetails,
          payload: "9");
    } on Exception catch (e) {
      print(e);
    }
  }
}

  Future notificationDetails() async{
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'Channel Id',
        'Channel Name',
        importance: Importance.max 
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          // await Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) =>
          //               Scan1Widget(),
          //         ),
          //       );
          sendNotifs();
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.tertiaryColor,
          size: 30,
        ),
      ),
      body: SafeArea(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StatWidget(),
              Expanded(
                child: 
        present ? Lists1Widget(thisWeek: thisWeek, nextWeek: nextWeek, later: later) : Text(""),
              ),
            ],
          ),
      ),
            ],
          ),
        ),
    );
  }
}
