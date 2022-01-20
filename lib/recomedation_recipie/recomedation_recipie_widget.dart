import '../components/expire4_widget.dart';
import '../components/home1_widget.dart';
import '../components/recomend_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecomedationRecipieWidget extends StatefulWidget {
  const RecomedationRecipieWidget({Key key}) : super(key: key);

  @override
  _RecomedationRecipieWidgetState createState() =>
      _RecomedationRecipieWidgetState();
}

class _RecomedationRecipieWidgetState extends State<RecomedationRecipieWidget> {
  double sliderValue;
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 70,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.tertiaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Color(0xFFDBE2EF),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Min',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                    Slider(
                                      activeColor:
                                          FlutterFlowTheme.primaryColor,
                                      inactiveColor: Color(0xFF9E9E9E),
                                      min: 0,
                                      max: 1,
                                      value: sliderValue ??= 0,
                                      label: sliderValue.toString(),
                                      divisions: 1,
                                      onChanged: (newValue) {
                                        setState(() => sliderValue = newValue);
                                      },
                                    ),
                                    Text(
                                      'Max',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: RecomendWidget(),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(),
                              child: Expire4Widget(),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              decoration: BoxDecoration(),
                              child: Home1Widget(),
                            ),
                          ],
                        ),
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
