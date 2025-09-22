import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'selezione_raggio_model.dart';
export 'selezione_raggio_model.dart';

class SelezioneRaggioWidget extends StatefulWidget {
  const SelezioneRaggioWidget({super.key});

  @override
  State<SelezioneRaggioWidget> createState() => _SelezioneRaggioWidgetState();
}

class _SelezioneRaggioWidgetState extends State<SelezioneRaggioWidget> {
  late SelezioneRaggioModel _model;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelezioneRaggioModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  Widget _buildPresetChip(String label, double value) {
    final isSelected = (_model.raggioSelezionato - value).abs() < 0.01;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _model.raggioSelezionato = value;
        });
      },
      child: Container(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF4287F5) : Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: isSelected ? Color(0xFF4287F5) : Color(0xFFE5E7EB),
            width: 1.0,
          ),
        ),
        child: Text(
          label,
          style: FlutterFlowTheme.of(context).bodySmall.override(
            font: GoogleFonts.dmSans(
              fontWeight: FontWeight.w500,
            ),
            color: isSelected ? Colors.white : Color(0xFF374151),
            letterSpacing: 0.0,
          ),
        ),
      ),
    );
  }

  String _formatDistance(double distance) {
    if (distance < 1.0) {
      return '${(distance * 1000).toInt()}m';
    } else {
      return '${distance.toStringAsFixed(1)}km';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          // Grabber
          Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Center(
              child: Container(
                width: 40.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: Color(0xFFE5E7EB),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
            ),
          ),
          
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
            child: Center(
              child: Text(
                'Distanza',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                  font: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                  ),
                  color: Color(0xFF1F2937),
                  letterSpacing: 0.0,
                ),
              ),
            ),
          ),
          
          // Contenuto principale
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imposta manualmente
                  Text(
                    'Imposta manualmente una distanza',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w600,
                      ),
                      color: Color(0xFFBDBDBD),
                      letterSpacing: 0.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  
                  // Slider con etichette
                  Container(
                    width: double.infinity,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: Column(
                      children: [
                        // Etichetta "Distanza" e valore
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Distanza',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                ),
                                color: Color(0xFF374151),
                                letterSpacing: 0.0,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              _formatDistance(_model.raggioSelezionato),
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w600,
                                ),
                                color: Color(0xFF4287F5),
                                letterSpacing: 0.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        
                        // Slider
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Color(0xFF4287F5),
                            inactiveTrackColor: Color(0xFFEFF6FF),
                            thumbColor: Color(0xFF4287F5),
                            overlayColor: Color(0xFF4287F5).withOpacity(0.2),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                            trackHeight: 6.0,
                            tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 2.0),
                            activeTickMarkColor: Color(0xFF4287F5),
                            inactiveTickMarkColor: Color(0xFFEFF6FF),
                          ),
                          child: Slider(
                            value: _model.raggioSelezionato,
                            min: 0.0,
                            max: 10.0,
                            divisions: 100,
                            onChanged: (value) {
                              setState(() {
                                _model.raggioSelezionato = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 8.0),
                        
                        // Etichette min/max
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '0m',
                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                font: GoogleFonts.dmSans(),
                                color: Color(0xFF6B7280),
                                letterSpacing: 0.0,
                              ),
                            ),
                            Text(
                              '10km',
                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                font: GoogleFonts.dmSans(),
                                color: Color(0xFF6B7280),
                                letterSpacing: 0.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 32.0),
                  
                  // Preset rapidi
                  Text(
                    'Preset rapidi',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w600,
                      ),
                      color: Color(0xFF1F2937),
                      letterSpacing: 0.0,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  
                  // Chip preset
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      _buildPresetChip('10m', 0.01),
                      _buildPresetChip('50m', 0.05),
                      _buildPresetChip('100m', 0.1),
                      _buildPresetChip('250m', 0.25),
                      _buildPresetChip('500m', 0.5),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Bottoni in fondo
          Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 32.0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                // Bottone Annulla
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
                          style: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w600,
                            ),
                            color: Color(0xFF4287F5),
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
                
                // Bottone Conferma
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () {
                      Navigator.pop(context, {
                        'raggio': _model.raggioSelezionato,
                        'raggioText': '${_model.raggioSelezionato.toInt()} km',
                      });
                    },
                    text: 'Conferma',
                    options: FFButtonOptions(
                      height: 48.0,
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF4287F5),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w600,
                        ),
                        color: Color(0xFFEFF6FF),
                        letterSpacing: 0.0,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
