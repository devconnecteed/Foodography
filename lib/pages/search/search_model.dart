import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  // List of search history items
  List<Map<String, String>> searchHistory = [
    {
      'title': 'Linguine Cacio e Pepe',
      'location': 'Dar Bruttone, Via Taranto, 118'
    },
    {
      'title': 'Pizza Margherita',
      'location': 'Pizzeria da Mario, Via Roma, 45'
    },
  ];

  // Track visibility of items
  bool showFirstItem = true;
  bool showSecondItem = true;

  @override
  void initState(BuildContext context) {}

  // Method to remove first item
  void removeFirstItem() {
    showFirstItem = false;
  }
  
  // Method to remove second item
  void removeSecondItem() {
    showSecondItem = false;
  }
  
  // Check if any items are visible
  bool get hasVisibleItems => showFirstItem || showSecondItem;

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
