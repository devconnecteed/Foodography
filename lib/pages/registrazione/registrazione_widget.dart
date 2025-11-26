import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'registrazione_model.dart';
export 'registrazione_model.dart';

class RegistrazioneWidget extends StatefulWidget {
  const RegistrazioneWidget({super.key});

  static const routeName = '/Registrazione';
  static const routePath = '/Registrazione';

  @override
  State<RegistrazioneWidget> createState() => _RegistrazioneWidgetState();
}

class _RegistrazioneWidgetState extends State<RegistrazioneWidget> {
  late RegistrazioneModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistrazioneModel());

    _model.nomeController ??= TextEditingController();
    _model.nomeFocusNode ??= FocusNode();

    _model.cognomeController ??= TextEditingController();
    _model.cognomeFocusNode ??= FocusNode();

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    _model.confermaPasswordController ??= TextEditingController();
    _model.confermaPasswordFocusNode ??= FocusNode();
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
        backgroundColor: Color(0xFFFFFFFF),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 24.0, 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header con freccia indietro
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          context.pushNamed(IniziaWidget.routeName);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40.0),

                  // Logo e titolo
                  Column(
                    children: [
                      // Logo
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Icon(
                          Icons.restaurant_menu,
                          color: Colors.white,
                          size: 40.0,
                        ),
                      ),
                      
                      SizedBox(height: 16.0),
                      
                      // Titolo Foodography
                      Text(
                        'Foodography',
                        style: GoogleFonts.dmSans(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                      
                      SizedBox(height: 8.0),
                      
                      // Sottotitolo
                      Text(
                        'Inserisci i tuoi dati e registrati',
                        style: GoogleFonts.dmSans(
                          fontSize: 16.0,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40.0),

                  // Form di registrazione
                  Column(
                    children: [
                      // Campo Nome
                      TextFormField(
                        controller: _model.nomeController,
                        focusNode: _model.nomeFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Nome *',
                          labelStyle: GoogleFonts.dmSans(
                            color: Color(0xFF6B7280),
                            fontSize: 16.0,
                          ),
                          hintText: 'Inserisci il tuo nome',
                          hintStyle: GoogleFonts.dmSans(
                            color: Color(0xFF9CA3AF),
                            fontSize: 16.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                        ),
                        style: GoogleFonts.dmSans(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 16.0),

                      // Campo Cognome
                      TextFormField(
                        controller: _model.cognomeController,
                        focusNode: _model.cognomeFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Cognome *',
                          labelStyle: GoogleFonts.dmSans(
                            color: Color(0xFF6B7280),
                            fontSize: 16.0,
                          ),
                          hintText: 'Inserisci il tuo cognome',
                          hintStyle: GoogleFonts.dmSans(
                            color: Color(0xFF9CA3AF),
                            fontSize: 16.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                        ),
                        style: GoogleFonts.dmSans(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 16.0),

                      // Campo Email
                      TextFormField(
                        controller: _model.emailController,
                        focusNode: _model.emailFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Email *',
                          labelStyle: GoogleFonts.dmSans(
                            color: Color(0xFF6B7280),
                            fontSize: 16.0,
                          ),
                          hintText: 'Inserisci la tua email',
                          hintStyle: GoogleFonts.dmSans(
                            color: Color(0xFF9CA3AF),
                            fontSize: 16.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                        ),
                        style: GoogleFonts.dmSans(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),

                      SizedBox(height: 16.0),

                      // Campo Password
                      TextFormField(
                        controller: _model.passwordController,
                        focusNode: _model.passwordFocusNode,
                        autofocus: false,
                        obscureText: !_model.passwordVisibility,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: GoogleFonts.dmSans(
                            color: Color(0xFF6B7280),
                            fontSize: 16.0,
                          ),
                          hintText: 'Inserisci la tua password',
                          hintStyle: GoogleFonts.dmSans(
                            color: Color(0xFF9CA3AF),
                            fontSize: 16.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => _model.passwordVisibility = !_model.passwordVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                          ),
                        ),
                        style: GoogleFonts.dmSans(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),

                      // Suggerimento password
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          children: [
                            Text(
                              'Inserisci almeno 8 caratteri e una lettera maiuscola',
                              style: GoogleFonts.dmSans(
                                fontSize: 14.0,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16.0),

                      // Campo Conferma Password
                      TextFormField(
                        controller: _model.confermaPasswordController,
                        focusNode: _model.confermaPasswordFocusNode,
                        autofocus: false,
                        obscureText: !_model.confermaPasswordVisibility,
                        decoration: InputDecoration(
                          labelText: 'Conferma password',
                          labelStyle: GoogleFonts.dmSans(
                            color: Color(0xFF6B7280),
                            fontSize: 16.0,
                          ),
                          hintText: 'Conferma la tua password',
                          hintStyle: GoogleFonts.dmSans(
                            color: Color(0xFF9CA3AF),
                            fontSize: 16.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => _model.confermaPasswordVisibility = !_model.confermaPasswordVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.confermaPasswordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                          ),
                        ),
                        style: GoogleFonts.dmSans(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 32.0),

                      // Bottone Registrati
                      FFButtonWidget(
                        onPressed: () async {
                          // TODO: Implementare registrazione
                          print('Registrati pressed');
                        },
                        text: 'Registrati',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 52.0,
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: GoogleFonts.dmSans(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),

                      SizedBox(height: 24.0),

                      // Link login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sei già utente? ',
                            style: GoogleFonts.dmSans(
                              fontSize: 16.0,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              context.pushNamed(IniziaWidget.routeName);
                            },
                            child: Text(
                              'Effettua il login',
                              style: GoogleFonts.dmSans(
                                fontSize: 16.0,
                                color: FlutterFlowTheme.of(context).primary,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
