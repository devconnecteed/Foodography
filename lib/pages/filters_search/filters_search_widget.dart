import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'filters_search_model.dart';
export 'filters_search_model.dart';

class FiltersSearchWidget extends StatefulWidget {
  const FiltersSearchWidget({super.key});

  static String routeName = 'FiltersSearch';
  static String routePath = '/filters-search';

  @override
  State<FiltersSearchWidget> createState() => _FiltersSearchWidgetState();
}

class _FiltersSearchWidgetState extends State<FiltersSearchWidget> {
  late FiltersSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltersSearchModel());

    _model.choiceChipsValueController1 ??= FormFieldController<List<String>>([]);
    _model.choiceChipsValueController2 ??= FormFieldController<List<String>>([]);
    _model.choiceChipsValueController3 ??= FormFieldController<List<String>>([]);

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with title and close button
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Filtri',
                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                              font: GoogleFonts.dmSans(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .fontStyle,
                            ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 48.0,
                      icon: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () {
                        context.safePop();
                      },
                    ),
                  ],
                ),
                
                // Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Section 1: Food Preferences
                          Text(
                            'Scegli cosa preferisci mangiare',
                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.dmSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData('Italiana'),
                                ChipData('Vegetariano'),
                                ChipData('Halal'),
                                ChipData('Vegano'),
                                ChipData('Pesce'),
                                ChipData('Kosher'),
                              ],
                              onChanged: (val) => safeSetState(() {
                                _model.choiceChipsValueController1?.value = val;
                              }),
                              selectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.dmSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                      color: Colors.white,
                                    ),
                                iconColor: Colors.white,
                                iconSize: 18.0,
                                elevation: 1.0,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Color(0xFFFFFFFF),
                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.dmSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                    ),
                                iconColor: FlutterFlowTheme.of(context).primaryText,
                                iconSize: 18.0,
                                elevation: 1.0,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              chipSpacing: 8.0,
                              rowSpacing: 8.0,
                              multiselect: true,
                              initialized: _model.choiceChipsValueController1?.value != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController1!,
                            ),
                          ),
                          
                          // Divider
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                          ),
                          
                          // Section 2: Intolerances and Allergies
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                            child: Text(
                              'Hai intolleranze o allergie?',
                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.dmSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData('Glutine'),
                                ChipData('Lattosio'),
                                ChipData('Arachidi'),
                                ChipData('Pesce'),
                                ChipData('Alcol'),
                                ChipData('Gamberi'),
                                ChipData('Nessuna'),
                              ],
                              onChanged: (val) => safeSetState(() {
                                _model.choiceChipsValueController2?.value = val;
                              }),
                              selectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.dmSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                      color: Colors.white,
                                    ),
                                iconColor: Colors.white,
                                iconSize: 18.0,
                                elevation: 1.0,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Color(0xFFFFFFFF),
                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.dmSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                    ),
                                iconColor: FlutterFlowTheme.of(context).primaryText,
                                iconSize: 18.0,
                                elevation: 1.0,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              chipSpacing: 8.0,
                              rowSpacing: 8.0,
                              multiselect: true,
                              initialized: _model.choiceChipsValueController2?.value != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController2!,
                            ),
                          ),
                          
                          // Divider
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                          ),
                          
                          // Section 3: Ingredients
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                            child: Text(
                              'Quali ingredienti vorresti mangiare?',
                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.dmSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData('Crudo di carne'),
                                ChipData('Pane'),
                                ChipData('Formaggi'),
                                ChipData('Spezie'),
                                ChipData('Crudo di pesce'),
                                ChipData('Pasta'),
                                ChipData('Pollo'),
                                ChipData('Maiale'),
                                ChipData('Panino'),
                                ChipData('Pizza'),
                                ChipData('Insalata'),
                                ChipData('Pesto'),
                                ChipData('Riso'),
                              ],
                              onChanged: (val) => safeSetState(() {
                                _model.choiceChipsValueController3?.value = val;
                              }),
                              selectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.dmSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                      color: Colors.white,
                                    ),
                                iconColor: Colors.white,
                                iconSize: 18.0,
                                elevation: 1.0,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Color(0xFFFFFFFF),
                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.dmSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                    ),
                                iconColor: FlutterFlowTheme.of(context).primaryText,
                                iconSize: 18.0,
                                elevation: 1.0,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              chipSpacing: 8.0,
                              rowSpacing: 8.0,
                              multiselect: true,
                              initialized: _model.choiceChipsValueController3?.value != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController3!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Buttons section
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Annulla button
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              context.safePop();
                            },
                            text: 'Reimposta',
                            options: FFButtonOptions(
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              color: Colors.transparent,
                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.dmSans(
                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      // Applica button
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              // TODO: Implement filter application logic
                              context.safePop();
                            },
                            text: 'Applica',
                            options: FFButtonOptions(
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.dmSans(
                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                color: Colors.white,
                              ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}