import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class MyAppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  ThemeMode _themeMode = ThemeMode.system;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();
  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
  }

  void setLocale(String language) {
    safeSetState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Foodography',
      scrollBehavior: MyAppScrollBehavior(),
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackMaterialLocalizationDelegate(),
        FallbackCupertinoLocalizationDelegate(),
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('it'),
        Locale('en'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: MaterialStateProperty.all(true),
          trackVisibility: MaterialStateProperty.all(true),
          interactive: true,
          thickness: MaterialStateProperty.all(2.0),
          radius: Radius.circular(20.0),
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.dragged)) {
              return Color(4282550261);
            }
            if (states.contains(MaterialState.hovered)) {
              return Color(4280176855);
            }
            return Color(4287940348);
          }),
        ),
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({
    Key? key,
    this.initialPage,
    this.page,
    this.disableResizeToAvoidBottomInset = false,
  }) : super(key: key);

  final String? initialPage;
  final Widget? page;
  final bool disableResizeToAvoidBottomInset;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'Homepage';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Homepage': HomepageWidget(),
      'Diario': DiarioWidget(),
      'Camera': CameraWidget(),
      'Profilo': ProfiloWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    final MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: !widget.disableResizeToAvoidBottomInset,
      body: MediaQuery(
          data: queryData
              .removeViewInsets(removeBottom: true)
              .removeViewPadding(removeBottom: true),
          child: _currentPage ?? tabs[_currentPageName]!),
      extendBody: true,
      bottomNavigationBar: _currentPageName == 'Camera' ? null : Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: FloatingNavbar(
              currentIndex: currentIndex,
              onTap: (i) => safeSetState(() {
                _currentPage = null;
                _currentPageName = tabs.keys.toList()[i];
              }),
              backgroundColor: Colors.transparent,
              selectedItemColor: Color(0xFF4287F5),
              unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
              selectedBackgroundColor: Color(0x00000000),
              borderRadius: 20.0,
              itemBorderRadius: 0.0,
              margin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
              width: 345.0,
              elevation: 0.0,
        items: [
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: currentIndex == 0
                      ? Color(0xFF4287F5)
                      : Color(0xFF172F56),
                  size: 24.0,
                ),
                SizedBox(height: 2.0),
                Text(
                  FFLocalizations.of(context).getText(
                    'ecm51r5s' /* Esplora */,
                  ),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 0
                        ? Color(0xFF4287F5)
                        : Color(0xFF172F56),
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 1 ? Icons.favorite : Icons.favorite_border,
                  color: currentIndex == 1
                      ? Color(0xFF4287F5)
                      : Color(0xFF172F56),
                  size: 24.0,
                ),
                SizedBox(height: 2.0),
                Text(
                  FFLocalizations.of(context).getText(
                    'p2cexxw6' /* Diario */,
                  ),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 1
                        ? Color(0xFF4287F5)
                        : Color(0xFF172F56),
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 2 ? Icons.camera_alt : Icons.camera_alt_outlined,
                  color: currentIndex == 2
                      ? Color(0xFF4287F5)
                      : Color(0xFF172F56),
                  size: 24.0,
                ),
                SizedBox(height: 2.0),
                Text(
                  FFLocalizations.of(context).getText(
                    'yqjeytqe' /* Camera */,
                  ),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 2
                        ? Color(0xFF4287F5)
                        : Color(0xFF172F56),
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 3 ? Icons.person_rounded : Icons.person_outline_rounded,
                  color: currentIndex == 3
                      ? Color(0xFF4287F5)
                      : Color(0xFF172F56),
                  size: 24.0,
                ),
                SizedBox(height: 2.0),
                Text(
                  FFLocalizations.of(context).getText(
                    '98uwn33y' /* Profilo */,
                  ),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 3
                        ? Color(0xFF4287F5)
                        : Color(0xFF172F56),
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
        ),
      ),
        ),
      ),
    );
  }
}
