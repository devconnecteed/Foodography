import '/flutter_flow/flutter_flow_util.dart';
import 'scatta_foto_widget.dart' show ScattaFotoWidget;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:torch_light/torch_light.dart';

class ScattaFotoModel extends FlutterFlowModel<ScattaFotoWidget> with ChangeNotifier {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  CameraController? cameraController;
  bool isCameraInitialized = false;
  bool isCameraInitializing = false;
  String? cameraError;
  List<CameraDescription>? cameras;
  bool isTorchOn = false;

  @override
  void initState(BuildContext context) {
    initializeCamera();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cameraController?.dispose();
    super.dispose();
  }

  Future<void> initializeCamera() async {
    try {
      isCameraInitializing = true;
      notifyListeners();
      
      cameras = await availableCameras();
      if (cameras!.isNotEmpty) {
        cameraController = CameraController(
          cameras![0],
          ResolutionPreset.high,
          enableAudio: false,
        );
        await cameraController!.initialize();
        isCameraInitialized = true;
        cameraError = null;
      } else {
        cameraError = 'Nessuna fotocamera disponibile';
      }
    } catch (e) {
      cameraError = 'Errore nell\'inizializzazione della fotocamera: $e';
      print(cameraError);
    } finally {
      isCameraInitializing = false;
      notifyListeners();
    }
  }

  Future<void> toggleTorch() async {
    try {
      if (isTorchOn) {
        await TorchLight.disableTorch();
        isTorchOn = false;
      } else {
        await TorchLight.enableTorch();
        isTorchOn = true;
      }
      notifyListeners();
    } catch (e) {
      print('Errore nel controllo della torcia: $e');
    }
  }

  Future<void> takePicture() async {
    if (cameraController != null && isCameraInitialized) {
      try {
        final XFile photo = await cameraController!.takePicture();
        print('Foto scattata: ${photo.path}');
        // Qui puoi gestire la foto scattata
      } catch (e) {
        print('Errore nello scatto: $e');
      }
    }
  }
}