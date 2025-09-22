import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'selezione_citta_model.dart';
export 'selezione_citta_model.dart';

class SelezioneCittaWidget extends StatefulWidget {
  const SelezioneCittaWidget({super.key});

  @override
  State<SelezioneCittaWidget> createState() => _SelezioneCittaWidgetState();
}

class _SelezioneCittaWidgetState extends State<SelezioneCittaWidget> {
  late SelezioneCittaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Lista delle città italiane con immagini
  final List<Map<String, dynamic>> citta = [
    {'id': 'roma', 'nome': 'Roma', 'regione': 'Lazio', 'selezionata': true, 'immagine': 'assets/images/roma.jpg'},
    {'id': 'milano', 'nome': 'Milano', 'regione': 'Lombardia', 'selezionata': false, 'immagine': 'assets/images/milano.jpg'},
    {'id': 'napoli', 'nome': 'Napoli', 'regione': 'Campania', 'selezionata': false, 'immagine': 'assets/images/napoli.jpg'},
    {'id': 'torino', 'nome': 'Torino', 'regione': 'Piemonte', 'selezionata': false, 'immagine': 'assets/images/torino.jpg'},
    {'id': 'firenze', 'nome': 'Firenze', 'regione': 'Toscana', 'selezionata': false, 'immagine': 'assets/images/firenze.jpg'},
    {'id': 'bologna', 'nome': 'Bologna', 'regione': 'Emilia-Romagna', 'selezionata': false, 'immagine': 'assets/images/bologna.jpg'},
    {'id': 'venezia', 'nome': 'Venezia', 'regione': 'Veneto', 'selezionata': false, 'immagine': 'assets/images/venezia.jpg'},
    {'id': 'genova', 'nome': 'Genova', 'regione': 'Liguria', 'selezionata': false, 'immagine': 'assets/images/genova.jpg'},
    {'id': 'bari', 'nome': 'Bari', 'regione': 'Puglia', 'selezionata': false, 'immagine': 'assets/images/bari.jpg'},
    {'id': 'palermo', 'nome': 'Palermo', 'regione': 'Sicilia', 'selezionata': false, 'immagine': 'assets/images/palermo.jpg'},
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelezioneCittaModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  void _selezionaCitta(Map<String, dynamic> cittaSelezionata) {
    setState(() {
      // Deseleziona tutte le città
      for (var citta in this.citta) {
        citta['selezionata'] = false;
      }
      // Seleziona la città cliccata
      cittaSelezionata['selezionata'] = true;
    });
  }

  void _confermaSelezione() {
    final cittaSelezionata = citta.firstWhere((c) => c['selezionata'] == true);
    Navigator.of(context).pop(cittaSelezionata);
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
                  'Seleziona Città',
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
            
            // Lista città in griglia 2x5
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: citta.length,
                  itemBuilder: (context, index) {
                    final cittaItem = citta[index];
                    final isSelected = cittaItem['selezionata'] as bool;
                    
                    return GestureDetector(
                      onTap: () => _selezionaCitta(cittaItem),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8.0,
                              color: Color(0x1A000000),
                              offset: Offset(0.0, 4.0),
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Stack(
                            children: [
                              // Immagine di sfondo della città
                              Positioned.fill(
                                child: Image.asset(
                                  cittaItem['immagine'],
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    // Fallback se l'immagine non viene caricata
                                    return Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFF4287F5).withOpacity(0.1),
                                            Color(0xFF4287F5).withOpacity(0.3),
                                          ],
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.location_city,
                                        color: isSelected 
                                          ? Color(0xFF4287F5)
                                          : Color(0xFF4287F5).withOpacity(0.6),
                                        size: 48.0,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              
                              // Gradiente scuro in basso
                              Positioned(
                                left: 0.0,
                                right: 0.0,
                                bottom: 0.0,
                                height: 80.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withOpacity(0.7),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              
                              // Contenuto
                              Positioned(
                                left: 0.0,
                                right: 0.0,
                                bottom: 0.0,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cittaItem['nome'],
                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                          font: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                      SizedBox(height: 4.0),
                                      Text(
                                        cittaItem['regione'],
                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                          font: GoogleFonts.dmSans(),
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              
                              // Icona selezione
                              if (isSelected)
                                Positioned(
                                  top: 12.0,
                                  right: 12.0,
                                  child: Container(
                                    width: 24.0,
                                    height: 24.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4287F5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 16.0,
                                    ),
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
