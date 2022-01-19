import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recipie2Widget extends StatelessWidget {
  
  var values;
  Recipie2Widget(this.values);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
      child: Container(
        width: 130,
        height: 100,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.tertiaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Color(0xFFAEE1E1),
            )
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFFAEE1E1),
            width: 0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  values['name'],
                  overflow: TextOverflow.ellipsis,
                  style: FlutterFlowTheme.title2.override(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    lineHeight: 1,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  values['amount'].toString(),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.primaryColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  values['unit'],
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w600,
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
