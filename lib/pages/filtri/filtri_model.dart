import '/flutter_flow/flutter_flow_util.dart';
import 'filtri_widget.dart' show FiltriWidget;
import 'package:flutter/material.dart';

class FiltriModel extends FlutterFlowModel<FiltriWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
