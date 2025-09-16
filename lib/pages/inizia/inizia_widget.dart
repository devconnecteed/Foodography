import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'inizia_model.dart';
export 'inizia_model.dart';

class IniziaWidget extends StatefulWidget {
  const IniziaWidget({super.key});

  static String routeName = 'Inizia';
  static String routePath = '/inizia';

  @override
  State<IniziaWidget> createState() => _IniziaWidgetState();
}

class _IniziaWidgetState extends State<IniziaWidget> {
  late IniziaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IniziaModel());

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
        body: ClipRRect(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Transform.scale(
                      scaleX: 1.2,
                      scaleY: 1.2,
                      child: FlutterFlowVideoPlayer(
                        path:
                            'assets/videos/3298231-uhd-2160-4096-25fps_Lk4OQ82s.mp4',
                        videoType: VideoType.asset,
                        autoPlay: true,
                        looping: true,
                        showControls: false,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: false,
                      ),
                    ),
                  ),
                  // =========================
                  // SEZIONE IN BASSO CON BLUR
                  // =========================
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: double.infinity,
                      height: 450.0,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0x0014181B), Color(0x7F14181B)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          // === LAYER BLUR con maschera (fade verso l'alto) ===
                          Positioned.fill(
                            child: IgnorePointer(
                              child: ShaderMask(
                                shaderCallback: (rect) => const LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  // Bianco = mostra il blur, Trasparente = nasconde
                                  colors: [
                                    Colors.white,
                                    Colors.white,
                                    Colors.transparent
                                  ],
                                  stops: [0.0, 0.72, 1.0], // esteso un po' più in alto
                                ).createShader(rect),
                                blendMode: BlendMode.dstIn,
                                child: ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 12.0,
                                      sigmaY: 12.0,
                                    ),
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // === OVERLAY OPACO (scurisce il fondo in basso) ===
                          Positioned.fill(
                            child: IgnorePointer(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    // Più opaco in basso -> trasparente verso l'alto
                                    colors: [
                                      Color(0xF014181B), // ~94% opaco in basso
                                      Color(0xCC14181B), // ~80% a 10%
                                      Colors.transparent, // svanisce già al 20%
                                    ],
                                    stops: [0.0, 0.1, 0.2],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // === LAYER CONTENUTI (non sfumati) ===
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 450.0,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0x00090F13),
                                              Color(0x991D2429)
                                            ],
                                            stops: [0.0, 0.5],
                                            begin: AlignmentDirectional(
                                                0.0, -1.0),
                                            end:
                                                AlignmentDirectional(0, 1.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              24.0, 100.0, 24.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                Opacity(
                                  opacity: 0.9,
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.25),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          HomepageWidget.routeName,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 300),
                                            ),
                                          },
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '4y6roroo' /* Continua con Apple */,
                                      ),
                                      icon: Icon(
                                        Icons.apple,
                                        size: 32.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 330.0,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.dmSans(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                              lineHeight: 1.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.8,
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.4),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'bdx72dms' /* Continua con Google */,
                                      ),
                                      icon: FaIcon(
                                        FontAwesomeIcons.google,
                                        size: 20.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 330.0,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.dmSans(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.8,
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.55),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          LoginWidget.routeName,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType.rightToLeft,
                                              duration: Duration(milliseconds: 300),
                                            ),
                                          },
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '0iggohg6' /* Continua con Email */,
                                      ),
                                      icon: Icon(
                                        Icons.email_rounded,
                                        size: 24.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 330.0,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.dmSans(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'eg63w2ox' /* Continuando accetti la nostra ... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        font: GoogleFonts.dmSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ]
                                  .divide(SizedBox(height: 16.0))
                                  .addToStart(SizedBox(height: 40.0))
                                  .addToEnd(SizedBox(height: 40.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.8, -0.8),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          HomepageWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 300),
                            ),
                          },
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'iiymex9c' /* Salta */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x7FEFEFEF),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              font: GoogleFonts.dmSans(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
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
