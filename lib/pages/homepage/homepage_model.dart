import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'homepage_widget.dart' show HomepageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class HomepageModel extends FlutterFlowModel<HomepageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  // Video controllers
  VideoPlayerController? videoController1;
  VideoPlayerController? videoController2;

  @override
  void initState(BuildContext context) {
    // Initialize video controllers
    videoController1 = VideoPlayerController.asset('assets/videos/4252806-uhd-2160-4096-25fps_HslKnRcA.mp4');
    videoController2 = VideoPlayerController.asset('assets/videos/5741337-hd-1080-1920-24fps_E5KXzCvy.mp4');
    
    // Initialize and play videos
    videoController1?.initialize().then((_) {
      videoController1?.setLooping(true);
      videoController1?.play();
    });
    
    videoController2?.initialize().then((_) {
      videoController2?.setLooping(true);
      videoController2?.play();
    });
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
    videoController1?.dispose();
    videoController2?.dispose();
  }
}
