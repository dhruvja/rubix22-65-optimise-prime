import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecomendWidget extends StatefulWidget {
  const RecomendWidget({Key key}) : super(key: key);

  @override
  _RecomendWidgetState createState() => _RecomendWidgetState();
}

class _RecomendWidgetState extends State<RecomendWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.tertiaryColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 0,
            color: FlutterFlowTheme.tertiaryColor,
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recommendation',
                      style: FlutterFlowTheme.subtitle1.override(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                      ),
                    ),
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
