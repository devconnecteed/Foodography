import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import '/pages/search/search_widget.dart';
import '/pages/posizione_attuale/posizione_attuale_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'homepage_model.dart';
export 'homepage_model.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({super.key});

  static String routeName = 'Homepage';
  static String routePath = '/home';

  @override
  State<HomepageWidget> createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  late HomepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageModel());

    // On page load action removed - homepage should show main content directly

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Remove focus from search bar when returning to homepage
    FocusScope.of(context).unfocus();
    _model.textFieldFocusNode?.unfocus();
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
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 56.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: true,
                                builder: (context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height * 0.85,
                                    child: PosizioneAttualeWidget(),
                                  );
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'k53u1bac' /* Posizione attuale */,
                                    ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.dmSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 8.0, 8.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    '0yg0jzcw' /* Cosa vuoi mangiare? */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.dmSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.dmSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF4287F5),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Color(0xFF172554),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.dmSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                cursorColor: Color(0xFF172554),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                                onTap: () async {
                                  context.pushNamed(SearchWidget.routeName);
                                },
                              ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 48.0,
                            icon: Icon(
                              Icons.emoji_events_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              context.pushNamed(
                                'Ranking',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );
                            },
                          ),
                        ].addToEnd(SizedBox(width: 8.0)),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              's77653qf' /* I piatti vicino a te */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.dmSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 250.0,
                          decoration: BoxDecoration(),
                          child: ListView(
                            padding: EdgeInsets.fromLTRB(
                              16.0,
                              0,
                              16.0,
                              0,
                            ),
                            scrollDirection: Axis.horizontal,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    DetailWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 300),
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: 200.0,
                                  height: 360.0,
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
                                        // Immagine di sfondo
                                        Positioned.fill(
                                                child: Image.asset(
                                                  'assets/images/pexels-enginakyurt-2703468.jpg',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                        // Gradiente scuro in basso
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: Container(
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.transparent,
                                                  Color(0xCC000000),
                                                ],
                                                stops: [0.0, 1.0],
                                            ),
                                          ),
                                        ),
                                        ),
                                        // Contenuto testuale
                                        Positioned(
                                          left: 16.0,
                                          right: 16.0,
                                          bottom: 16.0,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'msmreqzh' /* Linguine Cacio e Pepe */,
                                                ),
                                                style: FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      font: GoogleFonts.dmSans(
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              SizedBox(height: 4.0),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                          size: 16.0,
                                                        ),
                                                  SizedBox(width: 4.0),
                                                  Text(
                                                    '96 recensioni',
                                                    style: FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                              .override(
                                                          font: GoogleFonts.dmSans(),
                                                          color: Colors.white,
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
                                ),
                              ),
                              Container(
                                width: 200.0,
                                height: 360.0,
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
                                      // Immagine di sfondo
                                      Positioned.fill(
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxwYXN0YXxlbnwwfHx8fDE3NTY4MDg3ODB8MA&ixlib=rb-4.1.0&q=80&w=1080',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                      // Gradiente scuro in basso
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.transparent,
                                                Color(0xCC000000),
                                              ],
                                              stops: [0.0, 1.0],
                                          ),
                                        ),
                                      ),
                                      ),
                                      // Contenuto testuale
                                      Positioned(
                                        left: 16.0,
                                        right: 16.0,
                                        bottom: 16.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7bjaomkk' /* Pennette all'amatriciana */,
                                              ),
                                              style: FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                      .override(
                                                    font: GoogleFonts.dmSans(
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    color: Colors.white,
                                                        letterSpacing: 0.0,
                                                  ),
                                            ),
                                            SizedBox(height: 4.0),
                                            Row(
                                                  children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                              size: 16.0,
                                                            ),
                                                SizedBox(width: 4.0),
                                                Text(
                                                  '87 recensioni',
                                                  style: FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                                  .override(
                                                        font: GoogleFonts.dmSans(),
                                                        color: Colors.white,
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
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'b69pdxge' /* Filiere in evidenza */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.dmSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 430.0,
                          decoration: BoxDecoration(),
                          child: ListView(
                            padding: EdgeInsets.fromLTRB(
                              16.0,
                              0,
                              16.0,
                              0,
                            ),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                width: 250.0,
                                height: 300.0,
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
                                      // Video di sfondo
                                      Positioned.fill(
                                        child: _model.videoController1 != null &&
                                                _model.videoController1!.value.isInitialized
                                            ? VideoPlayer(_model.videoController1!)
                                            : Container(
                                                color: Colors.grey[300],
                                                child: Center(
                                                  child: CircularProgressIndicator(),
                                                ),
                                              ),
                                      ),
                                      // Gradiente scuro in basso
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                          child: Container(
                                          height: 100.0,
                                            decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.transparent,
                                                Color(0xCC000000),
                                              ],
                                              stops: [0.0, 1.0],
                                            ),
                                            ),
                                          ),
                                        ),
                                      // Contenuto testuale
                                      Positioned(
                                        left: 16.0,
                                        right: 16.0,
                                        bottom: 16.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'zysaoln7' /* Giovanni Rana */,
                                              ),
                                              style: FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                      .override(
                                                    font: GoogleFonts.dmSans(
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    color: Colors.white,
                                                        letterSpacing: 0.0,
                                                  ),
                                            ),
                                            SizedBox(height: 4.0),
                                            Row(
                                              children: [
                                                Icon(
                                                        Icons.dining,
                                                  color: Colors.white,
                                                        size: 16.0,
                                                      ),
                                                SizedBox(width: 4.0),
                                                Text(
                                                  'Amadori',
                                                  style: FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                                .override(
                                                        font: GoogleFonts.dmSans(),
                                                        color: Colors.white,
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
                              ),
                              Container(
                                width: 250.0,
                                height: 300.0,
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
                                      // Video di sfondo
                                      Positioned.fill(
                                        child: _model.videoController2 != null &&
                                                _model.videoController2!.value.isInitialized
                                            ? VideoPlayer(_model.videoController2!)
                                            : Container(
                                                color: Colors.grey[300],
                                                child: Center(
                                                  child: CircularProgressIndicator(),
                                                ),
                                              ),
                                      ),
                                      // Gradiente scuro in basso
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                          child: Container(
                                          height: 100.0,
                                            decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.transparent,
                                                Color(0xCC000000),
                                              ],
                                              stops: [0.0, 1.0],
                                            ),
                                            ),
                                          ),
                                        ),
                                      // Contenuto testuale
                                      Positioned(
                                        left: 16.0,
                                        right: 16.0,
                                        bottom: 16.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '27jrfjly' /* Giovanna Rana */,
                                              ),
                                              style: FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                      .override(
                                                    font: GoogleFonts.dmSans(
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    color: Colors.white,
                                                        letterSpacing: 0.0,
                                                  ),
                                            ),
                                            SizedBox(height: 4.0),
                                            Row(
                                              children: [
                                                Icon(
                                                        Icons.dining,
                                                  color: Colors.white,
                                                        size: 16.0,
                                                      ),
                                                SizedBox(width: 4.0),
                                                Text(
                                                  'Filiera integrata',
                                                  style: FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                                .override(
                                                        font: GoogleFonts.dmSans(),
                                                        color: Colors.white,
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
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'zpa1ik14' /* Viaggio nel gusto */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.dmSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 250.0,
                          decoration: BoxDecoration(),
                          child: ListView(
                            padding: EdgeInsets.fromLTRB(
                              16.0,
                              0,
                              16.0,
                              0,
                            ),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                width: 200.0,
                                height: 360.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                            child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Stack(
                                    children: [
                                      // Immagine di sfondo
                                      Positioned.fill(
                                              child: Image.asset(
                                                'assets/images/pexels-enginakyurt-1435904.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                      // Gradiente scuro in basso
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.transparent,
                                                Color(0xCC000000),
                                              ],
                                          ),
                                        ),
                                      ),
                                      ),
                                      // Contenuto testuale
                                      Positioned(
                                        left: 12.0,
                                        right: 12.0,
                                        bottom: 12.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'h9x929in' /* Una cucina che parla tutte le ... */,
                                              ),
                                              style: FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                      .override(
                                                    font: GoogleFonts.dmSans(
                                                      fontWeight: FontWeight.w600,
                                                        ),
                                                        letterSpacing: 0.0,
                                                    color: Colors.white,
                                                  ),
                                            ),
                                            SizedBox(height: 4.0),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 16.0,
                                                ),
                                                SizedBox(width: 4.0),
                                                Text(
                                                  '4.8 • 127 recensioni',
                                                  style: FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.dmSans(),
                                                        letterSpacing: 0.0,
                                                        color: Colors.white,
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
                              ),
                              Container(
                                width: 200.0,
                                height: 360.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                            child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Stack(
                                    children: [
                                      // Immagine di sfondo
                                      Positioned.fill(
                                              child: Image.asset(
                                                'assets/images/pexels-ella-olsson-572949-3026802.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                      // Gradiente scuro in basso
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.transparent,
                                                Color(0xCC000000),
                                              ],
                                          ),
                                        ),
                                      ),
                                      ),
                                      // Contenuto testuale
                                      Positioned(
                                        left: 12.0,
                                        right: 12.0,
                                        bottom: 12.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'lgnzj9dz' /* I sapori dell'Est */,
                                              ),
                                              style: FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                      .override(
                                                    font: GoogleFonts.dmSans(
                                                      fontWeight: FontWeight.w600,
                                                        ),
                                                        letterSpacing: 0.0,
                                                    color: Colors.white,
                                                  ),
                                            ),
                                            SizedBox(height: 4.0),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 16.0,
                                                ),
                                                SizedBox(width: 4.0),
                                                Text(
                                                  '4.9 • 89 recensioni',
                                                  style: FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.dmSans(),
                                                        letterSpacing: 0.0,
                                                        color: Colors.white,
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
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 120.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '19tn6qgb' /* I foodography del momento */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.dmSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 250.0,
                            decoration: BoxDecoration(),
                            child: ListView(
                              padding: EdgeInsets.fromLTRB(
                                16.0,
                                0,
                                16.0,
                                0,
                              ),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  width: 200.0,
                                  height: 360.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                              child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Stack(
                                      children: [
                                        // Immagine di sfondo
                                        Positioned.fill(
                                                child: Image.asset(
                                                  'assets/images/pexels-nano-erdozain-120534369-29039082.jpg',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                        // Gradiente scuro in basso
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: Container(
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.transparent,
                                                  Color(0xCC000000),
                                                ],
                                            ),
                                          ),
                                        ),
                                        ),
                                        // Contenuto testuale
                                        Positioned(
                                          left: 12.0,
                                          right: 12.0,
                                          bottom: 12.0,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'ed99kktf' /* 1° */,
                                                    ),
                                                    style: FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          font: GoogleFonts.dmSans(
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          color: Colors.white,
                                                        ),
                                                  ),
                                                  SizedBox(width: 8.0),
                                                  Expanded(
                                                    child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'yguofzhb' /* Crema romana */,
                                                    ),
                                                      style: FlutterFlowTheme.of(context)
                                                          .titleMedium
                                                        .override(
                                                            font: GoogleFonts.dmSans(
                                                              fontWeight: FontWeight.w600,
                                                          ),
                                                          letterSpacing: 0.0,
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 4.0),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 16.0,
                                                  ),
                                                  SizedBox(width: 4.0),
                                                  Text(
                                                    '4.7 • 203 recensioni',
                                                    style: FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts.dmSans(),
                                                          letterSpacing: 0.0,
                                                          color: Colors.white,
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
                                ),
                                Container(
                                  width: 200.0,
                                  height: 360.0,
                                            decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                            ),
                                              child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Stack(
                                      children: [
                                        // Immagine di sfondo
                                        Positioned.fill(
                                                child: Image.asset(
                                                  'assets/images/pexels-skyler-ewing-266953-10313344.jpg',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                        // Gradiente scuro in basso
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: Container(
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.transparent,
                                                  Color(0xCC000000),
                                                ],
                                            ),
                                          ),
                                        ),
                                        ),
                                        // Contenuto testuale
                                        Positioned(
                                          left: 12.0,
                                          right: 12.0,
                                          bottom: 12.0,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'y48vqxzn' /* 2° */,
                                                    ),
                                                    style: FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          font: GoogleFonts.dmSans(
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          color: Colors.white,
                                                        ),
                                                  ),
                                                  SizedBox(width: 8.0),
                                                  Expanded(
                                                    child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'mca6pwz8' /* Note d'orto */,
                                                    ),
                                                      style: FlutterFlowTheme.of(context)
                                                          .titleMedium
                                                        .override(
                                                            font: GoogleFonts.dmSans(
                                                              fontWeight: FontWeight.w600,
                                                          ),
                                                          letterSpacing: 0.0,
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 4.0),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 16.0,
                                                  ),
                                                  SizedBox(width: 4.0),
                                                  Text(
                                                    '4.6 • 156 recensioni',
                                                    style: FlutterFlowTheme.of(context)
                                                                  .bodyMedium
                                                        .override(
                                                          font: GoogleFonts.dmSans(),
                                                          letterSpacing: 0.0,
                                                          color: Colors.white,
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
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
