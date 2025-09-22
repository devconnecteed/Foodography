import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'nuovo_ricordo_model.dart';
export 'nuovo_ricordo_model.dart';

class NuovoRicordoWidget extends StatefulWidget {
  const NuovoRicordoWidget({super.key});

  static String routeName = 'NuovoRicordo';
  static String routePath = '/nuovo-ricordo';

  @override
  State<NuovoRicordoWidget> createState() => _NuovoRicordoWidgetState();
}

class _NuovoRicordoWidgetState extends State<NuovoRicordoWidget> with TickerProviderStateMixin {
  late NuovoRicordoModel _model;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NuovoRicordoModel());
    
    // Initialize animation controller
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    
    // Create slide animation from bottom to top
    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0), // Start from bottom
      end: Offset.zero, // End at normal position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
    
    // Start animation
    _animationController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    _animationController.dispose();
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Nuovo ricordo',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
              font: GoogleFonts.dmSans(
                fontWeight: FontWeight.bold,
              ),
              color: FlutterFlowTheme.of(context).primaryText,
              letterSpacing: 0.0,
            ),
          ),
          centerTitle: false,
          elevation: 0.0,
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.close,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  if (mounted) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ],
        ),
        body: SlideTransition(
          position: _slideAnimation,
          child: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: Form(
                key: _model.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                                // Dettagli del pasto section
                                _buildSectionTitle('Dettagli del pasto'),
                                SizedBox(height: 16.0),
                                
                                // Dish name field
                                _buildTextField(
                                  controller: _model.dishNameController,
                                  hintText: 'Nome del piatto*',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Il nome del piatto è obbligatorio';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16.0),
                                
                                // Restaurant name field
                                _buildTextField(
                                  controller: _model.restaurantNameController,
                                  hintText: 'Nome del ristorante*',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Il nome del ristorante è obbligatorio';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16.0),
                                
                                // Location field
                                _buildTextField(
                                  controller: _model.locationController,
                                  hintText: 'Località*',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'La località è obbligatoria';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16.0),
                                
                                // Date field
                                _buildDateField(),
                                SizedBox(height: 16.0),
                                
                                // Price field
                                _buildTextField(
                                  controller: _model.priceController,
                                  hintText: 'Prezzo',
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 24.0),
                                
                                // Rating section
                                _buildSectionTitle('La tua valutazione'),
                                SizedBox(height: 16.0),
                                
                                // Taste rating
                                _buildRatingItem('Gusto', _model.tasteRating, (rating) {
                                  setState(() {
                                    _model.setTasteRating(rating);
                                  });
                                }),
                                SizedBox(height: 16.0),
                                
                                // Presentation rating
                                _buildRatingItem('Presentazione', _model.presentationRating, (rating) {
                                  setState(() {
                                    _model.setPresentationRating(rating);
                                  });
                                }),
                                SizedBox(height: 16.0),
                                
                                // Ingredients rating
                                _buildRatingItem('Qualità ingredienti', _model.ingredientsRating, (rating) {
                                  setState(() {
                                    _model.setIngredientsRating(rating);
                                  });
                                }),
                                SizedBox(height: 16.0),
                                
                                // Price rating
                                _buildRatingItem('Prezzo', _model.priceRating, (rating) {
                                  setState(() {
                                    _model.setPriceRating(rating);
                                  });
                                }),
                                SizedBox(height: 24.0),
                                
                                // Notes section
                                _buildSectionTitle('Note e impressione'),
                                SizedBox(height: 16.0),
                                _buildNotesField(),
                                SizedBox(height: 24.0),
                                
                                // Tags section
                                _buildSectionTitle('Tag'),
                                SizedBox(height: 16.0),
                                _buildTagsSection(),
                                SizedBox(height: 24.0),
                                
                                // Add preview section
                                _buildSectionTitle('Immagine del piatto'),
                                SizedBox(height: 16.0),
                                _buildAddPreviewSection(),
                                SizedBox(height: 24.0),
                                
                      // Save button
                      _buildSaveButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: FlutterFlowTheme.of(context).titleMedium.override(
        font: GoogleFonts.dmSans(
          fontWeight: FontWeight.w600,
        ),
        color: FlutterFlowTheme.of(context).primaryText,
        letterSpacing: 0.0,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController? controller,
    required String hintText,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
          font: GoogleFonts.dmSans(),
          color: FlutterFlowTheme.of(context).secondaryText,
          letterSpacing: 0.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE0E0E0),
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
            color: Colors.red,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
        font: GoogleFonts.dmSans(),
        color: FlutterFlowTheme.of(context).primaryText,
        letterSpacing: 0.0,
      ),
    );
  }

  Widget _buildRatingItem(String title, int currentRating, Function(int) onRatingChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: FlutterFlowTheme.of(context).bodyLarge.override(
            font: GoogleFonts.dmSans(
              fontWeight: FontWeight.w500,
            ),
            color: FlutterFlowTheme.of(context).primaryText,
            letterSpacing: 0.0,
          ),
        ),
        Row(
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () {
                onRatingChanged(index + 1);
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                child: CustomPaint(
                  size: Size(32.0, 32.0),
                  painter: RoundedStarPainter(
                    color: index < currentRating ? Color(0xFF4287F5) : Color(0xFFEFF6FF),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildNotesField() {
    return TextFormField(
      controller: _model.notesController,
      maxLines: 4,
      decoration: InputDecoration(
        hintText: 'Racconta la tua esperienza',
        hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
          font: GoogleFonts.dmSans(),
          color: FlutterFlowTheme.of(context).secondaryText,
          letterSpacing: 0.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE0E0E0),
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
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
        font: GoogleFonts.dmSans(),
        color: FlutterFlowTheme.of(context).primaryText,
        letterSpacing: 0.0,
      ),
    );
  }

  Widget _buildTagsSection() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: _model.availableTags.map((tag) {
        final isSelected = _model.selectedTag == tag;
        return GestureDetector(
          onTap: () {
            setState(() {
              _model.selectTag(tag);
            });
          },
          child: Container(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFF4287F5) : Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(20.0),
              border: isSelected ? null : Border.all(
                color: Color(0xFFE0E0E0),
                width: 1.0,
              ),
            ),
            child: Text(
              tag,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.dmSans(),
                color: isSelected ? Colors.white : FlutterFlowTheme.of(context).primaryText,
                letterSpacing: 0.0,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAddPreviewSection() {
    return Container(
      width: double.infinity,
      height: 120.0,
      decoration: BoxDecoration(
        color: Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: CustomPaint(
        painter: DashedBorderPainter(
          color: Color(0xFFBDBDBD),
          strokeWidth: 2.0,
          borderRadius: 12.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.play_circle_outline,
                color: Color(0xFF4287F5),
                size: 32.0,
              ),
              SizedBox(height: 8.0),
              Text(
                'Aggiungi anteprima',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.dmSans(),
                  color: Color(0xFF4287F5),
                  letterSpacing: 0.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0xFF4287F5),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ElevatedButton(
        onPressed: () async {
          if (_model.validateForm()) {
            // TODO: Save the memory
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Ricordo salvato con successo!'),
                backgroundColor: Colors.green,
              ),
            );
            if (mounted) {
              Navigator.of(context).pop();
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          'Salva ricordo',
          style: FlutterFlowTheme.of(context).titleMedium.override(
            font: GoogleFonts.dmSans(
              fontWeight: FontWeight.w600,
            ),
            color: Colors.white,
            letterSpacing: 0.0,
          ),
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return TextFormField(
      controller: _model.dateController,
      readOnly: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'La data è obbligatoria';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Data*',
        hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
          font: GoogleFonts.dmSans(),
          color: FlutterFlowTheme.of(context).secondaryText,
          letterSpacing: 0.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE0E0E0),
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
            color: Colors.red,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        suffixIcon: Icon(
          Icons.calendar_today,
          color: Color(0xFF4287F5),
          size: 20.0,
        ),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
        font: GoogleFonts.dmSans(),
        color: FlutterFlowTheme.of(context).primaryText,
        letterSpacing: 0.0,
      ),
      onTap: () async {
        await _showCupertinoDatePicker();
      },
    );
  }

  Future<void> _showCupertinoDatePicker() async {
    DateTime selectedDate = DateTime.now();
    
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Grabber
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Color(0xFFD1D5DB),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  
                  // Header
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Text(
                      'Seleziona data',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                  ),
                  
                  // Calendar
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          // Month navigation
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setModalState(() {
                                    selectedDate = DateTime(selectedDate.year, selectedDate.month - 1, selectedDate.day);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.chevron_left,
                                    color: Color(0xFF1F2937),
                                    size: 24,
                                  ),
                                ),
                              ),
                              Text(
                                _capitalizeFirstLetter(DateFormat('MMMM yyyy', 'it').format(selectedDate)),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF1F2937),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  final nextMonth = DateTime(selectedDate.year, selectedDate.month + 1, selectedDate.day);
                                  if (nextMonth.isBefore(DateTime.now().add(Duration(days: 1)))) {
                                    setModalState(() {
                                      selectedDate = nextMonth;
                                    });
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: DateTime(selectedDate.year, selectedDate.month + 1, selectedDate.day).isAfter(DateTime.now()) 
                                        ? Color(0xFFD1D5DB) 
                                        : Color(0xFF1F2937),
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          SizedBox(height: 16),
                          
                          // Days of week
                          Row(
                            children: ['Dom', 'Lun', 'Mar', 'Mer', 'Gio', 'Ven', 'Sab']
                                .map((day) => Expanded(
                                      child: Center(
                                        child: Text(
                                          day,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF6B7280),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                          
                          SizedBox(height: 8),
                          
                          // Calendar grid
                          Expanded(
                            child: _buildCalendarGrid(selectedDate, setModalState, (newDate) {
                              setModalState(() {
                                selectedDate = newDate;
                              });
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Continue button
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 16, 20, 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
                          _model.dateController?.text = formattedDate;
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4287F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Continua',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildCalendarGrid(DateTime selectedDate, StateSetter setModalState, Function(DateTime) onDateSelected) {
    final firstDayOfMonth = DateTime(selectedDate.year, selectedDate.month, 1);
    final lastDayOfMonth = DateTime(selectedDate.year, selectedDate.month + 1, 0);
    final firstDayWeekday = firstDayOfMonth.weekday % 7; // Convert to Sunday = 0
    final daysInMonth = lastDayOfMonth.day;
    
    List<Widget> calendarDays = [];
    
    // Previous month days
    final prevMonth = DateTime(selectedDate.year, selectedDate.month - 1, 0);
    for (int i = firstDayWeekday - 1; i >= 0; i--) {
      final day = prevMonth.day - i;
      calendarDays.add(
        Container(
          height: 40,
          child: Center(
            child: Text(
              day.toString(),
              style: TextStyle(
                color: Color(0xFFD1D5DB),
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }
    
    // Current month days
    for (int day = 1; day <= daysInMonth; day++) {
      final currentDay = DateTime(selectedDate.year, selectedDate.month, day);
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final isFuture = currentDay.isAfter(today);
      final isSelected = day == selectedDate.day;
      
      calendarDays.add(
        GestureDetector(
          onTap: isFuture ? null : () {
            final newDate = DateTime(selectedDate.year, selectedDate.month, day);
            onDateSelected(newDate);
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFFDBEAFE) : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                day.toString(),
                style: TextStyle(
                  color: isSelected 
                      ? Color(0xFF2665EA) 
                      : isFuture 
                          ? Color(0xFFD1D5DB) 
                          : Color(0xFF1F2937),
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      );
    }
    
    // Next month days
    final remainingDays = 42 - calendarDays.length; // 6 rows * 7 days
    for (int day = 1; day <= remainingDays; day++) {
      calendarDays.add(
        Container(
          height: 40,
          child: Center(
            child: Text(
              day.toString(),
              style: TextStyle(
                color: Color(0xFFD1D5DB),
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }
    
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
      ),
      itemCount: calendarDays.length,
      itemBuilder: (context, index) => calendarDays[index],
    );
  }

  String _capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double borderRadius;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(borderRadius),
      ));

    // Create dashed effect
    final dashWidth = 8.0;
    final dashSpace = 4.0;
    final pathMetrics = path.computeMetrics();

    for (final pathMetric in pathMetrics) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final extractPath = pathMetric.extractPath(
          distance,
          distance + dashWidth,
        );
        canvas.drawPath(extractPath, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class RoundedStarPainter extends CustomPainter {
  final Color color;

  RoundedStarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final innerRadius = radius * 0.4;

    final path = Path();
    
    // Calcola i punti della stella a 5 punte
    for (int i = 0; i < 5; i++) {
      final angle = (i * 2 * 3.14159 / 5) - (3.14159 / 2);
      final outerX = center.dx + radius * cos(angle);
      final outerY = center.dy + radius * sin(angle);
      final innerX = center.dx + innerRadius * cos(angle + 3.14159 / 5);
      final innerY = center.dy + innerRadius * sin(angle + 3.14159 / 5);
      
      if (i == 0) {
        path.moveTo(outerX, outerY);
      } else {
        path.lineTo(outerX, outerY);
      }
      path.lineTo(innerX, innerY);
    }
    path.close();

    // Applica bordi arrotondati
    final roundedPath = Path();
    final pathMetrics = path.computeMetrics();
    for (final pathMetric in pathMetrics) {
      roundedPath.addPath(
        pathMetric.extractPath(0, pathMetric.length),
        Offset.zero,
      );
    }

    canvas.drawPath(roundedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
