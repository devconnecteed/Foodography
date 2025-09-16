import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  static const String routeName = 'Login';
  static const String routePath = '/login';

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();
    
    _model.passwordController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

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
          child: Column(
            children: [
              // Header con freccia indietro e titolo
              Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 24.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        context.safePop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      'Accedi con email e password.',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                        font: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                        ),
                        letterSpacing: 0.0,
                      ),
                    ),
                  ],
                ),
              ),

              // Contenuto principale
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 24.0, 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo e titolo
                      Column(
                        children: [
                          // Icona del logo
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/images/favicon.png',
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          
                          SizedBox(height: 16.0),
                          
                          // Titolo Foodography
                          Text(
                            'Foodography',
                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                              font: GoogleFonts.dmSans(
                                fontWeight: FontWeight.bold,
                              ),
                              color: Color(0xFF4287F5),
                              letterSpacing: 0.0,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 48.0),

                      // Form di login
                      Column(
                        children: [
                          // Campo Email
                          TextFormField(
                            controller: _model.emailController,
                            focusNode: _model.emailFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Inserisci la tua email',
                              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.dmSans(),
                                color: Color(0xFF9CA3AF),
                                letterSpacing: 0.0,
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
                                  color: Color(0xFF4287F5),
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
                              fillColor: Color(0xFFFFFFFF),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.dmSans(),
                              letterSpacing: 0.0,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: _model.emailControllerValidator.asValidator(context),
                          ),

                          SizedBox(height: 16.0),

                          // Campo Password
                          TextFormField(
                            controller: _model.passwordController,
                            focusNode: _model.passwordFocusNode,
                            autofocus: false,
                            obscureText: !_model.passwordVisibility,
                            decoration: InputDecoration(
                              hintText: 'Inserisci la tua password',
                              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.dmSans(),
                                color: Color(0xFF9CA3AF),
                                letterSpacing: 0.0,
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
                                  color: Color(0xFF4287F5),
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
                              fillColor: Color(0xFFFFFFFF),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                              suffixIcon: InkWell(
                                onTap: () => safeSetState(
                                  () => _model.passwordVisibility = !_model.passwordVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF9CA3AF),
                                  size: 22.0,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.dmSans(),
                              letterSpacing: 0.0,
                            ),
                            validator: _model.passwordControllerValidator.asValidator(context),
                          ),

                          SizedBox(height: 16.0),

                          // Riga con checkbox e link password dimenticata
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    value: _model.rememberMe ?? false,
                                    onChanged: (newValue) async {
                                      safeSetState(() => _model.rememberMe = newValue!);
                                    },
                                    side: BorderSide(
                                      width: 2,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                    activeColor: Color(0xFF4287F5),
                                    checkColor: Colors.white,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.compact,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    'Ricordami',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.dmSans(),
                                      color: Color(0xFF6B7280),
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // TODO: Implementare reset password
                                  print('Password dimenticata tapped');
                                },
                                child: Text(
                                  'Ho dimenticato la password',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.dmSans(),
                                    color: Color(0xFF4287F5),
                                    letterSpacing: 0.0,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 32.0),

                          // Bottone Login
                          FFButtonWidget(
                            onPressed: () async {
                              // TODO: Implementare login
                              print('Login pressed');
                              context.pushNamed('Homepage');
                            },
                            text: 'Login',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 52.0,
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF4287F5),
                              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                font: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w600,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),

                          SizedBox(height: 24.0),

                          // Link registrazione
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Nuovo utente? ',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.dmSans(),
                                  color: Color(0xFF6B7280),
                                  letterSpacing: 0.0,
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // TODO: Navigare alla pagina di registrazione
                                  print('Registrati qui tapped');
                                },
                                child: Text(
                                  'Registrati qui',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.dmSans(),
                                    color: Color(0xFF4287F5),
                                    letterSpacing: 0.0,
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
            ],
          ),
        ),
      ),
    );
  }
}
