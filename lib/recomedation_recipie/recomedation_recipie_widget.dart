import '../components/expire4_widget.dart';
import '../components/home1_widget.dart';
import '../components/inglist_widget.dart';
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
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 130, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.15, 0),
                        child: Text(
                          'Recipie Recomendation',
                          style: FlutterFlowTheme.title3,
                        ),
                      ),
                    ],
                  ),
                ),
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
                        'Max',
                        style: FlutterFlowTheme.bodyText1,
                      ),
                      Slider(
                        activeColor: FlutterFlowTheme.primaryColor,
                        inactiveColor: Color(0xFF9E9E9E),
                        min: 0,
                        max: 1,
                        value: sliderValue ??= 0,
                        divisions: 1,
                        onChanged: (newValue) {
                          setState(() => sliderValue = newValue);
                        },
                      ),
                      Text(
                        'Min',
                        style: FlutterFlowTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                InglistWidget(),
                Expire4Widget(),
                Home1Widget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
