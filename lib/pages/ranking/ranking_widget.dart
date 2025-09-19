import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ranking_model.dart';
import 'selezione_citta_widget.dart';
export 'ranking_model.dart';

class RankingWidget extends StatefulWidget {
  const RankingWidget({super.key});

  static String routeName = 'Ranking';
  static String routePath = '/ranking';

  @override
  State<RankingWidget> createState() => _RankingWidgetState();
}

class _RankingWidgetState extends State<RankingWidget> {
  late RankingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RankingModel());

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
            mainAxisSize: MainAxisSize.max,
            children: [
              // Header
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Classifica',
                      style: FlutterFlowTheme.of(context).headlineLarge.override(
                        font: GoogleFonts.dmSans(
                          fontWeight: FontWeight.bold,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 48.0,
                      icon: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                  ],
                ),
              ),
              // Description
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Text(
                  'Esplora i piatti più votati e cambia l\'ordine o la città per trovare il meglio vicino a te.',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.dmSans(),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
              // Filter buttons
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Roma chip
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Città',
                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                font: GoogleFonts.dmSans(),
                                color: FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            InkWell(
                              onTap: () async {
                                final result = await showModalBottomSheet<Map<String, dynamic>>(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: true,
                                  builder: (context) {
                                    return Container(
                                      height: MediaQuery.of(context).size.height * 0.8,
                                      child: SelezioneCittaWidget(),
                                    );
                                  },
                                );
                                
                                if (result != null) {
                                  setState(() {
                                    _model.cittaSelezionata = result['nome'] as String;
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFDBEAFE),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        _model.cittaSelezionata,
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          font: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          color: Color(0xFF4287F5),
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                      SizedBox(width: 8.0),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Color(0xFF4287F5),
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 12.0),
                        // Più votati chip
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ordinamento',
                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                font: GoogleFonts.dmSans(),
                                color: FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFDBEAFE),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Più votati',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w600,
                                        ),
                                        color: Color(0xFF4287F5),
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Color(0xFF4287F5),
                                      size: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 12.0),
                        // 2 km chip
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Raggio',
                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                font: GoogleFonts.dmSans(),
                                color: FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFDBEAFE),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '2 km',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w600,
                                        ),
                                        color: Color(0xFF4287F5),
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Color(0xFF4287F5),
                                      size: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 12.0),
                        // Categorie chip
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Categoria',
                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                font: GoogleFonts.dmSans(),
                                color: FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFDBEAFE),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Tutti',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w600,
                                        ),
                                        color: Color(0xFF4287F5),
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Color(0xFF4287F5),
                                      size: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Ranking list
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return _buildRankingItem(index + 1);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRankingItem(int rank) {
    final dishes = [
      {'name': 'Carbonara', 'location': 'Da felice a Testaccio', 'rating': '5.0', 'evaluations': null, 'image': 'assets/images/spaghetti-italiani-con-salsa-di-pomodoro-padella.jpg'},
      {'name': 'Amatriciana', 'location': 'Roscioli a Campo de\' Fiori', 'rating': '4.9', 'evaluations': null, 'image': 'assets/images/pexels-nano-erdozain-120534369-29039082.jpg'},
      {'name': 'Carbonara', 'location': 'Armando al Pantheon', 'rating': '4.8', 'evaluations': null, 'image': 'assets/images/spaghetti-italiani-con-salsa-di-pomodoro-padella.jpg'},
      {'name': 'Cacio e pepe', 'location': 'Da Enzo a Trastevere', 'rating': '4.7', 'evaluations': null, 'image': 'assets/images/pexels-skyler-ewing-266953-10313344.jpg'},
      {'name': 'Cacio e pepe', 'location': 'Tonnarello a Trastevere', 'rating': '4.6', 'evaluations': null, 'image': 'assets/images/pexels-skyler-ewing-266953-10313344.jpg'},
      {'name': 'Amatriciana', 'location': 'Da Cesare al Casaletto', 'rating': '4.5', 'evaluations': null, 'image': 'assets/images/pexels-nano-erdozain-120534369-29039082.jpg'},
      {'name': 'Carbonara', 'location': 'Flavio al Velavevodetto', 'rating': '4.4', 'evaluations': null, 'image': 'assets/images/spaghetti-italiani-con-salsa-di-pomodoro-padella.jpg'},
      {'name': 'Amatriciana', 'location': 'Da Danilo a Monti', 'rating': '4.3', 'evaluations': null, 'image': 'assets/images/pexels-nano-erdozain-120534369-29039082.jpg'},
      {'name': 'Cacio e pepe', 'location': 'Da Bucatino a Testaccio', 'rating': '4.2', 'evaluations': null, 'image': 'assets/images/pexels-skyler-ewing-266953-10313344.jpg'},
      {'name': 'Cacio e pepe', 'location': 'Da Augusto a Trastevere', 'rating': '4.1', 'evaluations': null, 'image': 'assets/images/pexels-skyler-ewing-266953-10313344.jpg'},
    ];

    final dish = dishes[rank - 1];

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Ranking number
          Container(
            width: 40.0,
            child: Text(
              rank.toString().padLeft(2, '0'),
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                font: GoogleFonts.dmSans(
                  fontWeight: FontWeight.bold,
                ),
              color: Color(0xFF172554),
              letterSpacing: 0.0,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          // Dish image
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                dish['image']!,
                width: 50.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          // Dish info
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish['name']!,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                    font: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
                ),
                if (dish['location'] != null) ...[
                  SizedBox(height: 4.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 16.0,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        dish['location']!,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                          font: GoogleFonts.dmSans(),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ],
                  ),
                ] else if (dish['evaluations'] != null) ...[
                  SizedBox(height: 4.0),
                  Text(
                    dish['evaluations']!,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                      font: GoogleFonts.dmSans(),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
                  ),
                ],
              ],
            ),
          ),
          // Rating
          Text(
            dish['rating']!,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
              font: GoogleFonts.dmSans(
                fontWeight: FontWeight.bold,
              ),
              color: FlutterFlowTheme.of(context).primaryText,
              letterSpacing: 0.0,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
