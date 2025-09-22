import '/flutter_flow/flutter_flow_model.dart';
import 'selezione_raggio_widget.dart' show SelezioneRaggioWidget;
import 'package:flutter/material.dart';

class SelezioneRaggioModel extends FlutterFlowModel<SelezioneRaggioWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  
  /// Raggio selezionato in km (valore predefinito: 5.0)
  double raggioSelezionato = 5.0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
