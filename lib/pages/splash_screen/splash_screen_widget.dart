import 'dart:async';
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'splash_screen_model.dart';
import '/index.dart';
export 'splash_screen_model.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  static String routeName = 'SplashScreen';
  static String routePath = '/splash';

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget>
    with TickerProviderStateMixin {
  late SplashScreenModel _model;
  bool _hasNavigated = false;
  Timer? _navigationTimer;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  bool _videoEnded = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());

    // Inizializza l'animazione di dissolvenza
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
    
    // Timer di sicurezza per navigare dopo un tempo massimo (8 secondi)
    _startNavigationTimer();
  }

  void _startNavigationTimer() {
    // Timer che simula la fine del video dopo 5 secondi
    // In una implementazione reale, questo dovrebbe essere collegato al video player
    _navigationTimer = Timer(const Duration(seconds: 5), () {
      if (!_hasNavigated && mounted) {
        _onVideoEnded();
      }
    });
  }

  void _onVideoEnded() {
    if (!_videoEnded && !_hasNavigated && mounted) {
      _videoEnded = true;
      _startFadeTransition();
    }
  }

  void _startFadeTransition() {
    if (_hasNavigated || !mounted) return;
    
    _hasNavigated = true;
    _navigationTimer?.cancel();
    
    // Avvia l'animazione di dissolvenza
    _fadeController.forward().then((_) {
      // Naviga dopo che l'animazione è completata SENZA transizioni aggiuntive
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const Onboarding01Widget(),
            transitionDuration: Duration.zero, // Nessuna transizione aggiuntiva
            reverseTransitionDuration: Duration.zero,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // Transizione istantanea - nessuna animazione
              return child;
            },
          ),
        );
      }
    });
  }


  @override
  void dispose() {
    _navigationTimer?.cancel();
    _fadeController.dispose();
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Permetti navigazione immediata al tocco
        if (!_hasNavigated) {
          _startFadeTransition();
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            // Video di sfondo
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: const FlutterFlowVideoPlayer(
                path: 'assets/videos/logo_animazione.mp4',
                videoType: VideoType.asset,
                autoPlay: true,
                looping: false,
                showControls: false,
                allowFullScreen: true,
                allowPlaybackSpeedMenu: false,
              ),
            ),
            // Overlay di dissolvenza che appare quando il video finisce
            AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withValues(alpha: _fadeAnimation.value),
                  child: _fadeAnimation.value > 0.3
                      ? const Onboarding01Widget()
                      : const SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
