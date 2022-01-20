import '../components/recipie2_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RecipietempWidget extends StatefulWidget {
  RecipietempWidget({Key key}) : super(key: key);

  @override
  _RecipietempWidgetState createState() => _RecipietempWidgetState();
}

class _RecipietempWidgetState extends State<RecipietempWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();


  var recipeInfo;
  var steps;
  bool present = false;

  void initState() {
    super.initState();
    getData();
    textController = TextEditingController();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt("id");
    // var id = "324694";
    print(id);
    var API_KEY = "8afaaf5604f4495fa9e9b52c1fb6a8ef";
    String url = "https://api.spoonacular.com/recipes/" +
        id.toString() +
        "/analyzedInstructions?apiKey=" +
        API_KEY;

    // String url = "http://192.168.0.192:5000/fetchrecipe";

    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);
    print(data);
    setState(() {
      steps = data[0];
    });
    url = "https://api.spoonacular.com/recipes/" +
        id.toString() +
        "/information?apiKey=" +
        API_KEY;
    response = await http.get(Uri.parse(url));
    data = json.decode(response.body);
    print(data);
    setState(() {
      recipeInfo = data;
      present = true;
      textController.text = data['summary'];
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
      body: 
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-0.95, 0),
                child: Text(
                  'Maa Ki Maaya',
                  style: FlutterFlowTheme.title1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.primaryColor,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          present ? recipeInfo['image'] : "https://spoonacular.com/recipeImages/716429-556x370.jpg",
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0xFFAEE1E1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
              if(present)
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      recipeInfo['title'],
                      style: FlutterFlowTheme.title1.override(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ...(recipeInfo['extendedIngredients']).map((ing){
                    return Recipie2Widget(ing);
                })
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 1,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.tertiaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'About Recipie',
                                          style: FlutterFlowTheme.title3,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme
                                                .tertiaryColor,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 5,
                                                color: Color(0xFFAEE1E1),
                                                offset: Offset(1, 0),
                                              )
                                            ],
                                          ),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(10, 10, 10, 10),
                                            child: TextFormField(
                                              controller: textController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText:
                                                    '[Some hint text...]',
                                                hintStyle: FlutterFlowTheme
                                                    .bodyText1,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.bodyText1,
                                              maxLines: 5
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Steps',
                                          style: FlutterFlowTheme.title3
                                              .override(
                                            fontFamily: 'Poppins',
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: 500,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme
                                                .tertiaryColor,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 10,
                                                color: Color(0xFFAEE1E1),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Flexible(
                                    child: ListView.builder(
                                      // Let the ListView know how many items it needs to build.
                                      itemCount: steps['steps'].length,
                                      // Provide a builder function. This is where the magic happens.
                                      // Convert each item into a widget based on the type of item it is.
                                      itemBuilder: (context, index) {
                                        final item =
                                            steps['steps'][index];

                                        return ListTile(
                                          leading: Text(item['number'].toString()),
                                          title: Text(item['step']),
                                        );
                                      },
                                    ),
                                  ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
