import '/flutter_flow/flutter_flow_util.dart';
import 'posizione_attuale_widget.dart' show PosizioneAttualeWidget;
import 'package:flutter/material.dart';

class PosizioneAttualeModel extends FlutterFlowModel<PosizioneAttualeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  TextEditingController? searchController;
  String? Function(BuildContext, String?)? searchControllerValidator;

  @override
  void initState(BuildContext context) {
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchController?.dispose();
  }
}
