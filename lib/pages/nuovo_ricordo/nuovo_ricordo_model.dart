import '/flutter_flow/flutter_flow_util.dart';
import 'nuovo_ricordo_widget.dart' show NuovoRicordoWidget;
import 'package:flutter/material.dart';

class NuovoRicordoModel extends FlutterFlowModel<NuovoRicordoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  
  // Form controllers
  TextEditingController? dishNameController;
  TextEditingController? restaurantNameController;
  TextEditingController? locationController;
  TextEditingController? dateController;
  TextEditingController? priceController;
  TextEditingController? notesController;
  
  // Rating states for each category
  int tasteRating = 0;
  int presentationRating = 0;
  int ingredientsRating = 0;
  int priceRating = 0;
  
  // Selected tag (only one allowed)
  String? selectedTag;
  
  // Available tags
  List<String> availableTags = ['Preferiti', 'Da recensire', 'Recensiti'];

  @override
  void initState(BuildContext context) {
    dishNameController = TextEditingController();
    restaurantNameController = TextEditingController();
    locationController = TextEditingController();
    dateController = TextEditingController();
    priceController = TextEditingController();
    notesController = TextEditingController();
  }

  @override
  void dispose() {
    dishNameController?.dispose();
    restaurantNameController?.dispose();
    locationController?.dispose();
    dateController?.dispose();
    priceController?.dispose();
    notesController?.dispose();
  }
  
  void selectTag(String tag) {
    if (selectedTag == tag) {
      selectedTag = null; // Deselect if same tag is clicked
    } else {
      selectedTag = tag; // Select new tag
    }
  }
  
  void setTasteRating(int newRating) {
    tasteRating = newRating;
  }
  
  void setPresentationRating(int newRating) {
    presentationRating = newRating;
  }
  
  void setIngredientsRating(int newRating) {
    ingredientsRating = newRating;
  }
  
  void setPriceRating(int newRating) {
    priceRating = newRating;
  }
  
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
