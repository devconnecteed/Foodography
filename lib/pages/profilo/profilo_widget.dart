import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profilo_model.dart';
export 'profilo_model.dart';

class ProfiloWidget extends StatefulWidget {
  const ProfiloWidget({super.key});

  static String routeName = 'Profilo';
  static String routePath = '/profilo';

  @override
  State<ProfiloWidget> createState() => _ProfiloWidgetState();
}

class _ProfiloWidgetState extends State<ProfiloWidget> {
  late ProfiloModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfiloModel());

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header con titolo "Profilo"
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: Text(
                    'Profilo',
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                      font: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
                // Sezione profilo utente
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Avatar
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            'assets/images/pexels-ella-olsson-572949-3026802.jpg',
                            width: 60.0,
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      // Informazioni utente
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Elena Rossi',
                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                font: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.bold,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'elena.rossi@gmail.com',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.dmSans(),
                                color: FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            // Modifica profilo
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 16.0,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  'Modifica profilo',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.dmSans(),
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Sezione Impostazioni
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 0.0),
                  child: Text(
                    'Impostazioni',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                      font: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
                // Lista opzioni
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildMenuItem('Valuta', Icons.attach_money),
                      _buildMenuItem('Lingua', Icons.language),
                      _buildMenuItem('Impostazioni notifiche', Icons.notifications),
                      _buildMenuItem('Aiuto e supporto', Icons.help),
                      _buildMenuItem('Centro assistenza', Icons.support_agent),
                      _buildMenuItem('Valuta l\'app', Icons.star),
                      _buildMenuItem('Condividi feedback', Icons.feedback),
                      _buildMenuItem('Segnala un problema', Icons.report),
                    ],
                  ),
                ),
                // Pulsante Logout
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 32.0),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          print('Logout pressed');
                          // Qui puoi aggiungere la logica di logout
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: FlutterFlowTheme.of(context).error,
                              size: 20.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'Logout',
                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                font: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                ),
                                color: FlutterFlowTheme.of(context).error,
                                letterSpacing: 0.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          print('Tapped: $title');
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title,
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                font: GoogleFonts.dmSans(),
                color: FlutterFlowTheme.of(context).primaryText,
                letterSpacing: 0.0,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}