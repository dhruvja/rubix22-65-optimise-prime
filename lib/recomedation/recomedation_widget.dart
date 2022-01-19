import '../components/food4_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecomedationWidget extends StatefulWidget {
  const RecomedationWidget({Key key}) : super(key: key);

  @override
  _RecomedationWidgetState createState() => _RecomedationWidgetState();
}

class _RecomedationWidgetState extends State<RecomedationWidget> {
  String dropDownValue1;
  String dropDownValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Row(
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
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 5, 0),
                                        child: FlutterFlowDropDown(
                                          initialOption: dropDownValue1 ??=
                                              'Expired',
                                          options:
                                              ['Expired', 'Active'].toList(),
                                          onChanged: (val) => setState(
                                              () => dropDownValue1 = val),
                                          width: 160,
                                          height: 50,
                                          textStyle: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                          ),
                                          hintText: 'Please select...',
                                          fillColor: Colors.white,
                                          elevation: 0,
                                          borderColor: Colors.black,
                                          borderWidth: 0,
                                          borderRadius: 4,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          hidesUnderline: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowDropDown(
                                        initialOption: dropDownValue2 ??=
                                            'Veggies',
                                        options:
                                            ['Veggies', 'Non veg'].toList(),
                                        onChanged: (val) => setState(
                                            () => dropDownValue2 = val),
                                        width: 160,
                                        height: 50,
                                        textStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                        ),
                                        hintText: 'Please select...',
                                        fillColor: Colors.white,
                                        elevation: 2,
                                        borderColor: Colors.black,
                                        borderWidth: 0,
                                        borderRadius: 3,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        hidesUnderline: true,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Food4Widget(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
