import 'package:makirasoii2/components/recipiesearch_component_widget.dart';

import '../components/expire4_widget.dart';
import '../components/home1_widget.dart';
import '../components/inglist_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class RecomedationRecipieWidget extends StatefulWidget {
  const RecomedationRecipieWidget({Key key}) : super(key: key);

  @override
  _RecomedationRecipieWidgetState createState() =>
      _RecomedationRecipieWidgetState();
}

class _RecomedationRecipieWidgetState extends State<RecomedationRecipieWidget> {
  double sliderValue = 1;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool present = false;
  var items;

  void initState(){
    super.initState();
    recommendation(1);
  }

  void recommendation(int val) async{
    String ingredients = "apple,orange,eggs,carrot,cheese";
    var url = "https://api.spoonacular.com/recipes/findByIngredients?ingredients= " + ingredients + "&ranking=" + val.toString() + "&apiKey=8afaaf5604f4495fa9e9b52c1fb6a8ef";
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);
    print(data);
    setState(() {
      items = data;
      present = true;
    });
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
        child: SingleChildScrollView(
                  child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Min',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                        Slider(
                          activeColor: FlutterFlowTheme.primaryColor,
                          inactiveColor: Color(0xFF9E9E9E),
                          min: 1,
                          max: 2,
                          value: sliderValue,
                          divisions: 1,
                          onChanged: (newValue) {
                            setState(() => sliderValue = newValue);
                            recommendation(newValue.round());
                          },
                        ),
                        Text(
                          'Max',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Expire4Widget(),
                  InglistWidget(),
                  if(present)
                     if(present)
                        ...(items).map((item){
                          return RecipiesearchComponentWidget(item);
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
