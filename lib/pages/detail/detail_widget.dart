import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detail_model.dart';
export 'detail_model.dart';

class DetailWidget extends StatefulWidget {
  const DetailWidget({super.key});

  static String routeName = 'Detail';
  static String routePath = '/detail';

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  late DetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailModel());

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
                      'Cacio e Pepe',
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
                  'Esplora i migliori ristoranti che servono Cacio e Pepe a Roma.',
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
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondary,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Roma',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w600,
                                        ),
                                        color: FlutterFlowTheme.of(context).primary,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: FlutterFlowTheme.of(context).primary,
                                      size: 20.0,
                                    ),
                                  ],
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
                                color: FlutterFlowTheme.of(context).secondary,
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
                                        color: FlutterFlowTheme.of(context).primary,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: FlutterFlowTheme.of(context).primary,
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
                                color: FlutterFlowTheme.of(context).secondary,
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
                                        color: FlutterFlowTheme.of(context).primary,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: FlutterFlowTheme.of(context).primary,
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
                                color: FlutterFlowTheme.of(context).secondary,
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
                                        color: FlutterFlowTheme.of(context).primary,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: FlutterFlowTheme.of(context).primary,
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
      {'name': 'Cacio e Pepe', 'location': 'Da Enzo a Trastevere', 'rating': '5.0', 'evaluations': '129', 'image': 'assets/images/pexels-enginakyurt-2703468.jpg'},
      {'name': 'Cacio e Pepe', 'location': 'Tonnarello a Trastevere', 'rating': '4.9', 'evaluations': '117', 'image': 'assets/images/pexels-enginakyurt-2703468.jpg'},
      {'name': 'Cacio e Pepe', 'location': 'Da Bucatino a Testaccio', 'rating': '4.8', 'evaluations': '98', 'image': 'assets/images/pexels-enginakyurt-2703468.jpg'},
      {'name': 'Cacio e Pepe', 'location': 'Da Augusto a Trastevere', 'rating': '4.7', 'evaluations': '87', 'image': 'assets/images/pexels-enginakyurt-2703468.jpg'},
      {'name': 'Cacio e Pepe', 'location': 'Flavio al Velavevodetto', 'rating': '4.6', 'evaluations': '76', 'image': 'assets/images/pexels-enginakyurt-2703468.jpg'},
      {'name': 'Cacio e Pepe', 'location': 'Roscioli a Campo de\' Fiori', 'rating': '4.5', 'evaluations': '65', 'image': 'assets/images/pexels-enginakyurt-2703468.jpg'},
      {'name': 'Cacio e Pepe', 'location': 'Da Cesare al Casaletto', 'rating': '4.4', 'evaluations': '54', 'image': 'assets/images/pexels-enginakyurt-2703468.jpg'},
      {'name': 'Cacio e Pepe', 'location': 'Da Danilo a Monti', 'rating': '4.3', 'evaluations': '43', 'image': 'assets/images/pexels-enginakyurt-2703468.jpg'},
      {'name': 'Cacio e Pepe', 'location': 'Armando al Pantheon', 'rating': '4.2', 'evaluations': '32', 'image': 'assets/images/pexels-enginakyurt-2703468.jpg'},
      {'name': 'Cacio e Pepe', 'location': 'Da Felice a Testaccio', 'rating': '4.1', 'evaluations': '21', 'image': 'assets/images/pexels-enginakyurt-2703468.jpg'},
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
              color: FlutterFlowTheme.of(context).secondary,
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
                  dish['location']!,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                    font: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xFFFFD700),
                      size: 16.0,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      '${dish['evaluations']!} valutazioni',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                        font: GoogleFonts.dmSans(),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ],
                ),
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
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}