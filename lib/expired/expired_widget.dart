import '../components/expire2_widget.dart';
import '../components/food1_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ExpiredWidget extends StatefulWidget {
  const ExpiredWidget({Key key}) : super(key: key);

  @override
  _ExpiredWidgetState createState() => _ExpiredWidgetState();
}

class _ExpiredWidgetState extends State<ExpiredWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var items;
  bool present = false;

  void initState() {
    super.initState();
    getItems();
  }

  void getItems() async {
    try {
      String url = "http://192.168.0.192:5000/" + "api/getexpired";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        var data = json.decode(response.body);
        // print(data);
        setState(() {
          items = data;
          present = true;
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: Color(0xFFB4DFF5),
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 30,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.tertiaryColor,
                ),
                child: SingleChildScrollView(
                                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expire2Widget(),
                      if (present)
                        ...(items).map((item) {
                          try {
                            var date = DateTime.parse(item['expiry_date']);
                            var formatter = DateFormat('dd-MM-yyyy');
                            String formatted = formatter.format(date);
                            item['expiry_date'] = formatted;
                          } catch (e) {
                            print(e);
                          }

                          return Food1Widget(item);
                        })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
