import '/flutter_flow/flutter_flow_model.dart';
import 'selezione_categorie_widget.dart' show SelezioneCategorieWidget;
import 'package:flutter/material.dart';

class SelezioneCategorieModel extends FlutterFlowModel<SelezioneCategorieWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  
  /// Lista delle categorie disponibili
  List<Map<String, dynamic>> categorie = [
    {
      'id': 'primi',
      'nome': 'Primi',
      'selezionata': true,
      'immagine': 'assets/images/carbonara.jpg',
    },
    {
      'id': 'secondi',
      'nome': 'Secondi',
      'selezionata': false,
      'immagine': 'assets/images/secondo.jpg',
    },
    {
      'id': 'dolci',
      'nome': 'Dolci',
      'selezionata': false,
      'immagine': 'assets/images/dolce.jpg',
    },
    {
      'id': 'antipasti',
      'nome': 'Antipasti',
      'selezionata': false,
      'immagine': 'assets/images/antipasto.jpg',
    },
    {
      'id': 'verdure',
      'nome': 'Verdure',
      'selezionata': false,
      'immagine': 'assets/images/verdure.jpg',
    },
    {
      'id': 'frutta',
      'nome': 'Frutta',
      'selezionata': false,
      'immagine': 'assets/images/frutta.jpg',
    },
  ];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
