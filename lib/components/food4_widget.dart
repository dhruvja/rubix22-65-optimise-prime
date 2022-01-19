import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Food4Widget extends StatefulWidget {
  const Food4Widget({Key key}) : super(key: key);

  @override
  _Food4WidgetState createState() => _Food4WidgetState();
}

class _Food4WidgetState extends State<Food4Widget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 100,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.tertiaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Color(0xFFCBF1F5),
            )
          ],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Color(0xFFD3E0DC),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                    child: Container(
                      width: 3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(3, 0, 80, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Expired',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lato',
                          color: Color(0xFFE21A1A),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                            border: Border.all(
                              color: Color(0xFF6A9106),
                              width: 3,
                            ),
                          ),
                          child: Icon(
                            Icons.stop_circle,
                            color: Color(0xFF6A9106),
                            size: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Food name',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lato',
                          color: Color(0xFF244F02),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'StoredDate',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lato',
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Text(
                          'DD/MM/YY',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Open Sans',
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Expired on',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFFDA1111),
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Text(
                          'dd/mm/yy',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.primaryColor,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'Donate',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF6A9106),
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 20, 0, 10),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Color(0xFF244F02),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
