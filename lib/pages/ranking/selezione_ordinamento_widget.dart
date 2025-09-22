import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'selezione_ordinamento_model.dart';
export 'selezione_ordinamento_model.dart';

class SelezioneOrdinamentoWidget extends StatefulWidget {
  const SelezioneOrdinamentoWidget({super.key});

  @override
  State<SelezioneOrdinamentoWidget> createState() => _SelezioneOrdinamentoWidgetState();
}

class _SelezioneOrdinamentoWidgetState extends State<SelezioneOrdinamentoWidget> {
  late SelezioneOrdinamentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Lista delle opzioni di ordinamento
  final List<Map<String, dynamic>> opzioniOrdinamento = [
    {
      'id': 'piu_votati',
      'titolo': 'Più votati',
      'sottotitolo': 'I punteggi più alti per primi',
      'selezionata': true
    },
    {
      'id': 'piu_recenti',
      'titolo': 'Più recenti',
      'sottotitolo': 'Le novità in cima',
      'selezionata': false
    },
    {
      'id': 'piu_recensiti',
      'titolo': 'Più recensiti',
      'sottotitolo': 'I più discussi',
      'selezionata': false
    },
    {
      'id': 'vicini_a_te',
      'titolo': 'Vicini a te',
      'sottotitolo': 'I più vicini per primi',
      'selezionata': false
    },
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelezioneOrdinamentoModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  void _selezionaOrdinamento(Map<String, dynamic> opzioneSelezionata) {
    setState(() {
      // Deseleziona tutte le opzioni
      for (var opzione in opzioniOrdinamento) {
        opzione['selezionata'] = false;
      }
      // Seleziona l'opzione cliccata
      opzioneSelezionata['selezionata'] = true;
    });
  }

  void _confermaSelezione() {
    final opzioneSelezionata = opzioniOrdinamento.firstWhere((o) => o['selezionata'] == true);
    Navigator.of(context).pop(opzioneSelezionata);
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
                  'Ordinamento',
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
            
            // Lista opzioni ordinamento
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                child: ListView.builder(
                  itemCount: opzioniOrdinamento.length,
                  itemBuilder: (context, index) {
                    final opzione = opzioniOrdinamento[index];
                    final isSelected = opzione['selezionata'] as bool;
                    
                    return Container(
                      margin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: InkWell(
                        onTap: () => _selezionaOrdinamento(opzione),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // Radio button
                              Container(
                                width: 18.0,
                                height: 18.0,
                                decoration: BoxDecoration(
                                  color: isSelected 
                                    ? Color(0xFF4287F5)
                                    : Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected 
                                      ? Color(0xFF4287F5)
                                      : FlutterFlowTheme.of(context).secondaryText,
                                    width: 2.0,
                                  ),
                                ),
                                child: isSelected
                                  ? Center(
                                      child: Container(
                                        width: 6.0,
                                        height: 6.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                  : null,
                              ),
                              SizedBox(width: 12.0),
                              
                              // Contenuto
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      opzione['titolo'],
                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                        font: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w600,
                                        ),
                                        color: isSelected 
                                          ? Color(0xFF4287F5)
                                          : FlutterFlowTheme.of(context).primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      opzione['sottotitolo'],
                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                        font: GoogleFonts.dmSans(),
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            
            // Bottoni in fondo
            Container(
              width: double.infinity,
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 32.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Pulsante Annulla
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      text: 'Annulla',
                      options: FFButtonOptions(
                        height: 48.0,
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.transparent,
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w600,
                          ),
                          color: Color(0xFF4287F5),
                          letterSpacing: 0.0,
                        ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  
                  SizedBox(width: 16.0),
                  
                  // Pulsante Conferma
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: _confermaSelezione,
                      text: 'Conferma',
                      options: FFButtonOptions(
                        height: 48.0,
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF4287F5),
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w600,
                          ),
                          color: Color(0xFFEFF6FF),
                          letterSpacing: 0.0,
                        ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
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
      ),
    );
  }
}
