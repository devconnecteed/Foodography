import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'filtri_model.dart';
export 'filtri_model.dart';

class FiltriWidget extends StatefulWidget {
  const FiltriWidget({super.key});

  static String routeName = 'Filtri';
  static String routePath = '/filtri';

  @override
  State<FiltriWidget> createState() => _FiltriWidgetState();
}

class _FiltriWidgetState extends State<FiltriWidget> {
  late FiltriModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltriModel());

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
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
              // Grabber
              Container(
                margin: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                width: 40.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: Color(0xFFD1D5DB),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              // Header
              Container(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFE0E0E0),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filtri',
                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                        font: GoogleFonts.dmSans(
                          fontWeight: FontWeight.bold,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (mounted) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Ordinamento
                      _buildSectionTitle('Ordinamento'),
                      SizedBox(height: 4.0),
                      _buildRadioSection([
                        {'value': 'recenti', 'label': 'Più recenti', 'selected': true},
                        {'value': 'votati', 'label': 'Più votati', 'selected': false},
                        {'value': 'vecchi', 'label': 'Più vecchi', 'selected': false},
                        {'value': 'preferiti', 'label': 'Preferiti', 'selected': false},
                      ]),
                      
                      SizedBox(height: 4.0),
                      
                      // Per ristorante
                      _buildSectionTitle('Per ristorante'),
                      SizedBox(height: 4.0),
                      _buildRestaurantSection([
                        {'value': 'dar_bruttone', 'label': 'Dar Bruttone', 'selected': true},
                        {'value': 'il_matriciano', 'label': 'Il Matriciano', 'selected': true},
                        {'value': 'da_felice', 'label': 'Da Felice a Testaccio', 'selected': false},
                      ]),
                      
                      SizedBox(height: 4.0),
                      
                      // Per area geografica
                      _buildSectionTitle('Per area geografica'),
                      SizedBox(height: 4.0),
                      _buildCheckboxSection([
                        {'value': 'roma', 'label': 'Roma', 'selected': true},
                        {'value': 'torino', 'label': 'Torino', 'selected': false},
                        {'value': 'milano', 'label': 'Milano', 'selected': false},
                        {'value': 'napoli', 'label': 'Napoli', 'selected': false},
                      ]),
                      SizedBox(height: 4.0),
                      GestureDetector(
                        onTap: () {
                          // TODO: Implementare espansione altre città
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Vedi altri',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.dmSans(),
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                              ),
                            ),
                            SizedBox(width: 4.0),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 16.0,
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: 4.0),
                      
                      // Per tipo di cucina
                      _buildSectionTitle('Per tipo di cucina'),
                      SizedBox(height: 4.0),
                      _buildChipSection([
                        {'value': 'italiana', 'label': 'Italiana', 'selected': true},
                        {'value': 'asiatica', 'label': 'Asiatica', 'selected': false},
                        {'value': 'vegan', 'label': 'Vegan', 'selected': false},
                        {'value': 'dessert', 'label': 'Dessert', 'selected': false},
                      ]),
                      
                      SizedBox(height: 4.0),
                      
                      // Per valutazione
                      _buildSectionTitle('Per valutazione'),
                      SizedBox(height: 4.0),
                      _buildRatingHorizontalSection([
                        {'value': '5', 'label': '5', 'selected': true},
                        {'value': '4', 'label': '4+', 'selected': false},
                        {'value': '3', 'label': '3+', 'selected': false},
                        {'value': '2', 'label': '2+', 'selected': false},
                      ]),
                    ],
                  ),
                ),
              ),
              
              // Action buttons
              Container(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 24.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Color(0xFFE0E0E0),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if (mounted) {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Container(
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Center(
                            child: Text(
                              'Annulla',
                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                font: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w600,
                                ),
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Container(
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            // TODO: Applicare i filtri
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Filtri applicati!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            if (mounted) {
                              Navigator.of(context).pop();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: Text(
                            'Applica',
                            style: FlutterFlowTheme.of(context).titleMedium.override(
                              font: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w600,
                              ),
                              color: Colors.white,
                              letterSpacing: 0.0,
                            ),
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
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: FlutterFlowTheme.of(context).titleMedium.override(
        font: GoogleFonts.dmSans(
          fontWeight: FontWeight.w600,
        ),
        color: FlutterFlowTheme.of(context).primaryText,
        letterSpacing: 0.0,
      ),
    );
  }

  Widget _buildRadioSection(List<Map<String, dynamic>> options) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5.0,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 2.0,
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              // Deseleziona tutti gli altri
              for (var opt in options) {
                opt['selected'] = false;
              }
              // Seleziona quello cliccato
              option['selected'] = true;
            });
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
            child: Row(
            children: [
              Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: option['selected'] ? FlutterFlowTheme.of(context).primary : Color(0xFFD1D5DB),
                    width: 2.0,
                  ),
                  color: option['selected'] ? FlutterFlowTheme.of(context).primary : Colors.transparent,
                ),
                child: option['selected']
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 12.0,
                      )
                    : null,
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Text(
                  option['label'],
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                    font: GoogleFonts.dmSans(),
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ],
          ),
          ),
        );
      },
    );
  }

  Widget _buildRestaurantSection(List<Map<String, dynamic>> options) {
    return Column(
      children: options.asMap().entries.map((entry) {
        final index = entry.key;
        final option = entry.value;
        return Column(
          children: [
            GestureDetector(
          onTap: () {
            setState(() {
              option['selected'] = !option['selected'];
            });
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
            child: Row(
              children: [
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: option['selected'] ? FlutterFlowTheme.of(context).primary : Color(0xFFD1D5DB),
                      width: 2.0,
                    ),
                    color: option['selected'] ? FlutterFlowTheme.of(context).primary : Colors.transparent,
                  ),
                  child: option['selected']
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 12.0,
                        )
                      : null,
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                    option['label'],
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.dmSans(),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
            if (index < options.length - 1) SizedBox(height: 2.0),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildCheckboxSection(List<Map<String, dynamic>> options) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5.0,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 2.0,
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              option['selected'] = !option['selected'];
            });
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
            child: Row(
            children: [
              Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: option['selected'] ? FlutterFlowTheme.of(context).primary : Color(0xFFD1D5DB),
                    width: 2.0,
                  ),
                  color: option['selected'] ? FlutterFlowTheme.of(context).primary : Colors.transparent,
                ),
                child: option['selected']
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 12.0,
                      )
                    : null,
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Text(
                  option['label'],
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                    font: GoogleFonts.dmSans(),
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ],
          ),
          ),
        );
      },
    );
  }

  Widget _buildChipSection(List<Map<String, dynamic>> options) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: options.map((option) {
        return GestureDetector(
          onTap: () {
            setState(() {
              option['selected'] = !option['selected'];
            });
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
            decoration: BoxDecoration(
              color: option['selected'] ? FlutterFlowTheme.of(context).primary : Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(20.0),
              border: option['selected'] ? null : Border.all(
                color: Color(0xFFE0E0E0),
                width: 1.0,
              ),
            ),
            child: Text(
              option['label'],
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.dmSans(),
                color: option['selected'] ? Colors.white : FlutterFlowTheme.of(context).primaryText,
                letterSpacing: 0.0,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }


  Widget _buildRatingHorizontalSection(List<Map<String, dynamic>> options) {
    return Row(
      children: options.map((option) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                option['selected'] = !option['selected'];
              });
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              margin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: option['selected'] ? FlutterFlowTheme.of(context).primary : Color(0xFFD1D5DB),
                        width: 2.0,
                      ),
                      color: option['selected'] ? FlutterFlowTheme.of(context).primary : Colors.transparent,
                    ),
                    child: option['selected']
                        ? Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 12.0,
                          )
                        : null,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    option['label'],
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.dmSans(),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Icon(
                    Icons.star,
                    color: Color(0xFFD1D5DB),
                    size: 16.0,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

}