import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'selezione_categorie_model.dart';
export 'selezione_categorie_model.dart';

class SelezioneCategorieWidget extends StatefulWidget {
  const SelezioneCategorieWidget({super.key});

  @override
  State<SelezioneCategorieWidget> createState() => _SelezioneCategorieWidgetState();
}

class _SelezioneCategorieWidgetState extends State<SelezioneCategorieWidget> {
  late SelezioneCategorieModel _model;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelezioneCategorieModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  void _selezionaCategoria(Map<String, dynamic> categoria) {
    setState(() {
      // Deseleziona tutte le categorie
      for (var item in _model.categorie) {
        item['selezionata'] = false;
      }
      // Seleziona la categoria cliccata
      categoria['selezionata'] = true;
    });
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
                'Categorie',
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
          
          // Lista categorie
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: 1.2,
                ),
                itemCount: _model.categorie.length,
                itemBuilder: (context, index) {
                  final categoria = _model.categorie[index];
                  final isSelected = categoria['selezionata'] as bool;
                  
                  return GestureDetector(
                    onTap: () => _selezionaCategoria(categoria),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x1A000000),
                            offset: Offset(0.0, 2.0),
                            blurRadius: 8.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Stack(
                          children: [
                            // Immagine di sfondo
                            Positioned.fill(
                              child: Image.asset(
                                categoria['immagine'],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Color(0xFF4287F5), Color(0xFF1D4ED8)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.restaurant,
                                        color: Colors.white,
                                        size: 40.0,
                                      ),
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
                              height: 60.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.7),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                            ),
                            
                            // Nome categoria
                            Positioned(
                              left: 12.0,
                              right: 12.0,
                              bottom: 12.0,
                              child: Text(
                                categoria['nome'],
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            
                            // Icona di selezione
                            if (isSelected)
                              Positioned(
                                top: 8.0,
                                right: 8.0,
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
                      final categoriaSelezionata = _model.categorie.firstWhere(
                        (categoria) => categoria['selezionata'] == true,
                      );
                      Navigator.pop(context, {
                        'categoria': categoriaSelezionata['nome'],
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
