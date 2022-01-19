import 'package:makirasoii2/components/scan_widget.dart';
import 'package:makirasoii2/scan1/scan1_widget.dart';

import '../components/food1_widget.dart';
import '../components/stat_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class CartWidget extends StatefulWidget {
  const CartWidget({Key key}) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var items;
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
        print(data);
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
        onPressed: () async{
          await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Scan1Widget(),
                  ),
                );
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
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: Color(0xFF00063D),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF26BFA4),
                  )
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StatWidget(),
                    if(present)
                      ...(items).map((item){
                        return Food1Widget(item);
                      })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
