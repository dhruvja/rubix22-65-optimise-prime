import '../components/expire2_copy_widget.dart';
import '../components/lists1_widget.dart';
import '../components/stat_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KitchenWidget extends StatefulWidget {
  const KitchenWidget({Key key}) : super(key: key);

  @override
  _KitchenWidgetState createState() => _KitchenWidgetState();
}

class _KitchenWidgetState extends State<KitchenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.tertiaryColor,
          size: 30,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expire2CopyWidget(),
            StatWidget(),
            Expanded(
              child: Lists1Widget(),
            ),
          ],
        ),
      ),
    );
  }
}
