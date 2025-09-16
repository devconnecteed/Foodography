import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'scatta_foto_model.dart';
export 'scatta_foto_model.dart';

class ScattaFotoWidget extends StatefulWidget {
  const ScattaFotoWidget({super.key});

  static String routeName = 'ScattaFoto';
  static String routePath = '/scatta-foto';

  @override
  State<ScattaFotoWidget> createState() => _ScattaFotoWidgetState();
}

class _ScattaFotoWidgetState extends State<ScattaFotoWidget>
    with TickerProviderStateMixin {
  late ScattaFotoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScattaFotoModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ListenableBuilder(
            listenable: _model,
            builder: (context, child) {
              return Stack(
                children: [
                  // =========================
                  // FOTOCAMERA FULL HEIGHT
                  // =========================
                  if (_model.isCameraInitialized && _model.cameraController != null)
                    Positioned.fill(
                      child: CameraPreview(_model.cameraController!),
                    )
                  else if (_model.isCameraInitializing)
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Inizializzazione fotocamera...',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else if (_model.cameraError != null)
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 64,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Errore fotocamera',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              _model.cameraError!,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                _model.initializeCamera();
                              },
                              child: Text('Riprova'),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  
                  // =========================
                  // CORNICE BIANCA AL CENTRO
                  // =========================
                  Center(
                    child: Container(
                      width: 280.0,
                      height: 280.0,
                      child: CustomPaint(
                        painter: CornerFramePainter(),
                        size: Size(280.0, 280.0),
                      ),
                    ),
                  ),
                  
                  // =========================
                  // PULSANTI X E TORCIA IN ALTO
                  // =========================
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Pulsante X
                        Container(
                          width: 44.0,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: Color(0x7FEFEFEF),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: IconButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          ),
                        ),
                        // Pulsante Torcia
                        Container(
                          width: 44.0,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: _model.isTorchOn ? Colors.yellow : Color(0x7FEFEFEF),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: IconButton(
                            onPressed: () async {
                              await _model.toggleTorch();
                            },
                            icon: Icon(
                              _model.isTorchOn ? Icons.flashlight_off : Icons.flashlight_on,
                              color: _model.isTorchOn ? Colors.black : Colors.white,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // =========================
                  // BOTTONE CAMERA IN BASSO
                  // =========================
                  if (_model.isCameraInitialized)
                    Positioned(
                      bottom: MediaQuery.of(context).padding.bottom + 40,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: GestureDetector(
                          onTap: () async {
                            await _model.takePicture();
                          },
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                              size: 28.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CornerFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final cornerLength = 40.0;
    
    // Angolo in alto a sinistra
    canvas.drawLine(
      Offset(0, cornerLength),
      Offset(0, 0),
      paint,
    );
    canvas.drawLine(
      Offset(0, 0),
      Offset(cornerLength, 0),
      paint,
    );
    
    // Angolo in alto a destra
    canvas.drawLine(
      Offset(size.width - cornerLength, 0),
      Offset(size.width, 0),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width, cornerLength),
      paint,
    );
    
    // Angolo in basso a sinistra
    canvas.drawLine(
      Offset(0, size.height - cornerLength),
      Offset(0, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(0, size.height),
      Offset(cornerLength, size.height),
      paint,
    );
    
    // Angolo in basso a destra
    canvas.drawLine(
      Offset(size.width - cornerLength, size.height),
      Offset(size.width, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width, size.height - cornerLength),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}