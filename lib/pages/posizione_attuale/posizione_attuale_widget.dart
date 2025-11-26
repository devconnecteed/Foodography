import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'posizione_attuale_model.dart';
export 'posizione_attuale_model.dart';

class PosizioneAttualeWidget extends StatefulWidget {
  const PosizioneAttualeWidget({super.key});

  static const String routeName = 'PosizioneAttuale';
  static const String routePath = '/posizioneAttuale';

  @override
  State<PosizioneAttualeWidget> createState() => _PosizioneAttualeWidgetState();
}

class _PosizioneAttualeWidgetState extends State<PosizioneAttualeWidget> {
  late PosizioneAttualeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PosizioneAttualeModel());

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
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Località',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                      font: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                      ),
                      color: Color(0xFF1F2937),
                      letterSpacing: 0.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      color: Color(0xFF1F2937),
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            
            // Content
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Bar
                    Container(
                      width: double.infinity,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Color(0xFFE5E7EB),
                          width: 1.0,
                        ),
                      ),
                      child: TextFormField(
                        controller: _model.searchController,
                        validator: (val) => _model.searchControllerValidator?.call(context, val),
                        decoration: InputDecoration(
                          hintText: 'Cerca località',
                          hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.dmSans(),
                            color: Color(0xFF9CA3AF),
                            letterSpacing: 0.0,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF9CA3AF),
                            size: 20.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.dmSans(),
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 16.0),
                    
                    // Use Current Location Button
                    Container(
                      width: double.infinity,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                      ),
                      child: InkWell(
                        onTap: () async {
                          // TODO: Implementare geolocalizzazione
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.send,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'Usa la tua posizione',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                ),
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 24.0),
                    
                    // Other Locations Section
                    Text(
                      'Altre località',
                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                        font: GoogleFonts.dmSans(
                          fontWeight: FontWeight.bold,
                        ),
                        color: Color(0xFF1F2937),
                        letterSpacing: 0.0,
                      ),
                    ),
                    
                    SizedBox(height: 16.0),
                    
                    // Cities List
                    Expanded(
                      child: ListView(
                        children: [
                          _buildLocationItem('Milano', 'MI', 'Italia'),
                          _buildLocationItem('Roma', 'RM', 'Italia'),
                          _buildLocationItem('Firenze', 'FI', 'Italia'),
                          _buildLocationItem('Torino', 'TO', 'Italia'),
                          _buildLocationItem('Bologna', 'BO', 'Italia'),
                          _buildLocationItem('Monza', 'MB', 'Italia'),
                          _buildLocationItem('Napoli', 'NA', 'Italia'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationItem(String city, String province, String country) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
      child: InkWell(
        onTap: () async {
          // TODO: Implementare selezione città
          Navigator.of(context).pop();
        },
        child: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Color(0xFF9CA3AF),
              size: 20.0,
            ),
            SizedBox(width: 12.0),
            Text(
              '$city, $province, $country',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.dmSans(),
                color: Color(0xFF6B7280),
                letterSpacing: 0.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}