import '../components/recipiesearch_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class RecipiesearchWidget extends StatefulWidget {
  const RecipiesearchWidget({Key key}) : super(key: key);

  @override
  _RecipiesearchWidgetState createState() => _RecipiesearchWidgetState();
}

class _RecipiesearchWidgetState extends State<RecipiesearchWidget> {
  TextEditingController textController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var items;
  bool present = false;
  bool search = false;

  void initState(){
    super.initState();
    recommend();
  }

  void recommend() async{
    try {
      String url = "http://192.168.0.192:5000/" + "recommend";
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

  void getItems() async {
    try {
      // String url = "http://192.168.0.192:5000/" + "api/getitem";
      String text = "noodles";
      String url = "https://api.spoonacular.com/recipes/complexSearch?query="+ text + "&apiKey=8afaaf5604f4495fa9e9b52c1fb6a8ef";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        var data = json.decode(response.body);
        print(data);
        setState(() {
          items = data['results'];
          present = true;
          search = true;
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: TextFormField(
                      controller: textController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: FlutterFlowTheme.bodyText1,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.tertiaryColor,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                        prefixIcon: Icon(
                          Icons.search,
                          color: FlutterFlowTheme.primaryColor,
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1,
                      onFieldSubmitted: (String text){
                        getItems();
                      }
                    ),
                  ),
                  if(present)
                      ...(items).map((item){
                        return RecipiesearchComponentWidget(item);
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
