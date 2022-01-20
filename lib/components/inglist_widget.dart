import '../components/recipie2_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InglistWidget extends StatefulWidget {
  const InglistWidget({Key key}) : super(key: key);

  @override
  _InglistWidgetState createState() => _InglistWidgetState();
}

class _InglistWidgetState extends State<InglistWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.tertiaryColor,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Recipie2Widget(),
              Recipie2Widget(),
              Recipie2Widget(),
              Recipie2Widget(),
            ],
          ),
        ),
      ),
    );
  }
}
