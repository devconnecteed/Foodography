import '/flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'registrazione_widget.dart' show RegistrazioneWidget;
import 'package:flutter/material.dart';

class RegistrazioneModel extends FlutterFlowModel<RegistrazioneWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;

  // State field(s) for Cognome widget.
  FocusNode? cognomeFocusNode;
  TextEditingController? cognomeController;
  String? Function(BuildContext, String?)? cognomeControllerValidator;

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;

  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;

  // State field(s) for ConfermaPassword widget.
  FocusNode? confermaPasswordFocusNode;
  TextEditingController? confermaPasswordController;
  late bool confermaPasswordVisibility;
  String? Function(BuildContext, String?)? confermaPasswordControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    confermaPasswordVisibility = false;
  }

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeController?.dispose();

    cognomeFocusNode?.dispose();
    cognomeController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    confermaPasswordFocusNode?.dispose();
    confermaPasswordController?.dispose();
  }
}
