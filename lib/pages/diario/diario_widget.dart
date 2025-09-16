import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'diario_model.dart';
import '../nuovo_ricordo/nuovo_ricordo_widget.dart';
import '../filtri/filtri_widget.dart';
export 'diario_model.dart';

class DiarioWidget extends StatefulWidget {
  const DiarioWidget({super.key});

  static String routeName = 'Diario';
  static String routePath = '/diario';

  @override
  State<DiarioWidget> createState() => _DiarioWidgetState();
}

class _DiarioWidgetState extends State<DiarioWidget> with TickerProviderStateMixin {
  late DiarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiarioModel());
    _tabController = TabController(length: 3, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    _tabController.dispose();
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Il mio diario',
                            style: FlutterFlowTheme.of(context).headlineLarge.override(
                              font: GoogleFonts.dmSans(
                                fontWeight: FontWeight.bold,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '2 Novembre 2026',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.dmSans(),
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  letterSpacing: 0.0,
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: FlutterFlowTheme.of(context).secondaryText,
                                size: 20.0,
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Tieni traccia dei tuoi piatti, foto e recensioni.',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.dmSans(),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Filtri button
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Color(0xFFE0E0E0),
                                width: 1.0,
                              ),
                            ),
                            child: FlutterFlowIconButton(
                              borderRadius: 12.0,
                              buttonSize: 44.0,
                              icon: Icon(
                                Icons.tune,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await showModalBottomSheet<void>(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (BuildContext context) {
                                    return FiltriWidget();
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 12.0),
                          // Add button
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF4287F5),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: FlutterFlowIconButton(
                              borderRadius: 12.0,
                              buttonSize: 44.0,
                              icon: Icon(
                                Icons.add,
                                color: Color(0xFFFFFFFF),
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => NuovoRicordoWidget(),
                                    transitionDuration: Duration(milliseconds: 300),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      return SlideTransition(
                                        position: Tween<Offset>(
                                          begin: Offset(0.0, 1.0), // Start from bottom
                                          end: Offset.zero, // End at normal position
                                        ).animate(CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeOut,
                                        )),
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Day selector
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildDayChip('Sab 6', false),
                        SizedBox(width: 12.0),
                        _buildDayChip('Dom 7', false),
                        SizedBox(width: 12.0),
                        _buildDayChip('Lun 8', true),
                        SizedBox(width: 12.0),
                        _buildDayChip('Mar 9', false),
                        SizedBox(width: 12.0),
                        _buildDayChip('Mer 10', false),
                        SizedBox(width: 12.0),
                        _buildDayChip('Gio 11', false),
                      ],
                    ),
                  ),
                ),
              ),
              // Tab bar
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                child: TabBar(
                  controller: _tabController,
                  labelColor: Color(0xFF4287F5),
                  unselectedLabelColor: Color(0xFFBDBDBD),
                  labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    font: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w600,
                    ),
                    letterSpacing: 0.0,
                  ),
                  unselectedLabelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    font: GoogleFonts.dmSans(),
                    letterSpacing: 0.0,
                  ),
                  indicatorColor: Color(0xFF4287F5),
                  indicatorWeight: 2.0,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(
                      child: Container(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        child: Text('Preferiti 6'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        child: Text('Da recensire 2'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        child: Text('Recensiti'),
                      ),
                    ),
                  ],
                ),
              ),
              // Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildFavoritesTab(),
                    _buildToReviewTab(),
                    _buildReviewsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDayChip(String day, bool isSelected) {
    final parts = day.split(' ');
    final dayName = parts[0];
    final dayNumber = parts[1];
    
    return Container(
      width: 56.0,
      height: 70.0,
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFDBEAFE) : Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20.0),
        border: isSelected ? null : Border.all(
          color: Color(0xFFEFEFEF),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayName,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.dmSans(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
                color: isSelected ? Color(0xFF2665EA) : Color(0xFF7C7C7C),
                letterSpacing: 0.0,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              dayNumber,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.dmSans(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
                color: isSelected ? Color(0xFF2665EA) : Color(0xFF172554),
                letterSpacing: 0.0,
              ),
            ),
            if (isSelected) ...[
              SizedBox(height: 4.0),
              Container(
                width: 6.0,
                height: 6.0,
                decoration: BoxDecoration(
                  color: Color(0xFF2665EA),
                  borderRadius: BorderRadius.circular(3.0),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFavoritesTab() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: 2,
        itemBuilder: (context, index) {
          return _buildReviewCard(index: index, tabType: 'favorites');
        },
      ),
    );
  }

  Widget _buildToReviewTab() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: 2,
        itemBuilder: (context, index) {
          return _buildReviewCard(index: index, tabType: 'toReview');
        },
      ),
    );
  }

  Widget _buildReviewsTab() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: 2,
        itemBuilder: (context, index) {
          return _buildReviewCard(index: index, tabType: 'reviews');
        },
      ),
    );
  }

  Widget _buildReviewCard({required int index, required String tabType}) {
    // Define different content for each card
    final cardData = _getCardData(index, tabType);
    
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: Color(0xFFDCDCDC),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Content
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardData['title']!,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.dmSans(
                          fontWeight: FontWeight.bold,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      cardData['restaurant']!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.dmSans(),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      cardData['location']!,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                        font: GoogleFonts.dmSans(),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (starIndex) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                          child: Icon(
                            Icons.star,
                            color: starIndex < cardData['rating']! ? Color(0xFF172F56) : Color(0xFFE5E5E5),
                            size: 16.0,
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      cardData['description']!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.dmSans(),
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              // Image
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    cardData['image']!,
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> _getCardData(int index, String tabType) {
    final List<Map<String, dynamic>> cardDataList = [
      {
        'title': 'Pizza Margherita DOP',
        'restaurant': 'Pizzeria "Da Michele"',
        'location': 'Roma, Italia',
        'rating': 5,
        'description': 'Autentica! Impasto perfetto, mozzarella di bufala cremosa e pomodori San Marzano dolcissimi.',
        'image': 'assets/images/pexels-ella-olsson-572949-3026802.jpg',
      },
      {
        'title': 'Spaghetti Carbonara',
        'restaurant': 'Trattoria "La Carbonara"',
        'location': 'Roma, Italia',
        'rating': 4,
        'description': 'Perfetta cremosità, uova fresche e guanciale croccante. Un classico romano impeccabile.',
        'image': 'assets/images/spaghetti-italiani-con-salsa-di-pomodoro-padella.jpg',
      },
      {
        'title': 'Risotto ai Porcini',
        'restaurant': 'Ristorante "Il Fungo"',
        'location': 'Milano, Italia',
        'rating': 5,
        'description': 'Cremoso e saporito, con porcini freschi e parmigiano stagionato. Un capolavoro di sapori.',
        'image': 'assets/images/pexels-enginakyurt-1435904.jpg',
      },
      {
        'title': 'Osso Buco alla Milanese',
        'restaurant': 'Osteria "Del Buon Gusto"',
        'location': 'Milano, Italia',
        'rating': 4,
        'description': 'Tenero e saporito, con risotto allo zafferano. Un piatto della tradizione lombarda.',
        'image': 'assets/images/pexels-enginakyurt-2703468.jpg',
      },
      {
        'title': 'Tiramisù della Casa',
        'restaurant': 'Pasticceria "Dolce Vita"',
        'location': 'Firenze, Italia',
        'rating': 5,
        'description': 'Mascarpone cremoso, caffè intenso e cacao amaro. Il dolce perfetto per concludere il pasto.',
        'image': 'assets/images/pexels-nano-erdozain-120534369-29039082.jpg',
      },
      {
        'title': 'Lasagne al Forno',
        'restaurant': 'Trattoria "Nonna Maria"',
        'location': 'Bologna, Italia',
        'rating': 4,
        'description': 'Strati di pasta fresca, ragù saporito e besciamella cremosa. Un comfort food perfetto.',
        'image': 'assets/images/pexels-skyler-ewing-266953-10313344.jpg',
      },
    ];

    // Return different data based on tab and index
    final dataIndex = (tabType == 'favorites' ? 0 : tabType == 'toReview' ? 2 : 4) + index;
    return cardDataList[dataIndex % cardDataList.length];
  }
}