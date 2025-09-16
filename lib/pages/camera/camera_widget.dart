import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'camera_model.dart';
export 'camera_model.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  static String routeName = 'Camera';
  static String routePath = '/camera';

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget>
    with TickerProviderStateMixin {
  late CameraModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                      scaleX: 1.4,
                      scaleY: 1.4,
                      child: FlutterFlowVideoPlayer(
                        path:
                            'assets/videos/6953896-uhd-4096-2160-25fps-jptg4ffp-bhhbv0pl_s4Fi0Owz.mp4',
                        videoType: VideoType.asset,
                        autoPlay: true,
                        looping: true,
                        showControls: false,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: false,
                      ),
                    ),
                  ),
                  // Pulsante X in alto a sinistra
                  Positioned(
                    top: 60.0,
                    left: 16.0,
                    child: Container(
                      width: 44.0,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: Color(0x7FEFEFEF),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          context.pushNamed(
                            'Homepage',
                            extra: <String, dynamic>{},
                          );
                        },
                        icon: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                  // Contenuto testuale in basso con blur
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
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
                                .fromSTEB(16.0, 8.0, 16.0, 0.0),
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
                                      child: Icon(
                                        Icons.info_outline,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        size: 48.0,
                                      ),
                                    ),
                                    SizedBox(height: 24.0),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(
                                              0.0, 0.3),
                                      child: Text(
                                        'Come funziona?',
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
                                    SizedBox(height: 24.0),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(
                                              0.0, 0.3),
                                      child: Text(
                                        '1. Posiziona il piatto all\'interno dell\'area designata e scatta la foto\n2. Visualizza i dettagli del piatto e pubblica il tuo voto',
                                        textAlign:
                                            TextAlign.center,
                                        style:
                                            FlutterFlowTheme.of(
                                                    context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts
                                                      .dmSans(
                                                    fontWeight: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  letterSpacing:
                                                      0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Align(
                              alignment:
                                  AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional
                                        .fromSTEB(0.0, 24.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(
                                                0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              'ScattaFoto',
                                              extra: <String, dynamic>{},
                                            );
                                          },
                                          text: 'Inizia',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 48.0,
                                            padding:
                                                EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(
                                                    context)
                                                .primaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts
                                                          .dmSans(
                                                        fontWeight: FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                      ),
                                                      color: Color(0xFF4287F5),
                                                      letterSpacing:
                                                          0.0,
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
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(
                                                    16.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}