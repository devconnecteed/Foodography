import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding01_model.dart';
export 'onboarding01_model.dart';

class Onboarding01Widget extends StatefulWidget {
  const Onboarding01Widget({super.key});

  static String routeName = 'Onboarding_01';
  static String routePath = '/onboarding01';

  @override
  State<Onboarding01Widget> createState() => _Onboarding01WidgetState();
}

class _Onboarding01WidgetState extends State<Onboarding01Widget> {
  late Onboarding01Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding01Model());

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
        body: ClipRRect(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
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
                            'assets/videos/4058084-uhd-2160-4096-25fps_KNun3Ijw.mp4',
                        videoType: VideoType.asset,
                        autoPlay: true,
                        looping: true,
                        showControls: false,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.8, -0.8),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: FFLocalizations.of(context).getText(
                        '0kynm3d2' /* Salta */,
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
                                    // Più opaco in basso -> trasparente verso l’alto
                                    colors: [
                                      Color(0xF014181B), // ~94% opaco in basso
                                      Color(0xCC14181B), // ~80% a 35%
                                      Colors.transparent, // svanisce
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 402.0,
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
                                          padding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(16.0, 100.0, 16.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.3),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'j507r2u2' /* Benvenuto
in Foodography! */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .dmSans(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .fontWeight,
                                                                    fontStyle:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .fontStyle,
                                                                  ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text.rich(
                                                          TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'L\'app che soddisfa i tuoi gusti.\n',
                                                                style: FlutterFlowTheme.of(context)
                                                                    .labelLarge
                                                                    .override(
                                                                      font: GoogleFonts.dmSans(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(context)
                                                                          .primaryBackground,
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
                                                              TextSpan(
                                                                text: 'Letteralmente!',
                                                                style: FlutterFlowTheme.of(context)
                                                                    .labelLarge
                                                                    .override(
                                                                      font: GoogleFonts.dmSans(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(context)
                                                                          .primaryBackground,
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
                                                            ],
                                                          ),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(
                                                            height: 16.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.75),
                                                          child:
                                                              FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              context
                                                                  .pushNamed(
                                                                Onboarding02Widget
                                                                    .routeName,
                                                                extra: <
                                                                    String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      const TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            600),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '7w27cxg4' /* Inizia */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 48.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .dmSans(
                                                                          fontWeight:
                                                                              FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                          fontStyle:
                                                                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF2E7D32),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                        fontStyle:
                                                                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(const SizedBox(
                                                    height: 48.0)),
                                              ),
                                            ]
                                                .divide(const SizedBox(
                                                    height: 40.0))
                                                .addToStart(const SizedBox(
                                                    height: 0.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 48.0))
                                      .addToStart(
                                          const SizedBox(height: 48.0))
                                      .addToEnd(const SizedBox(height: 0.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // =========================
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
