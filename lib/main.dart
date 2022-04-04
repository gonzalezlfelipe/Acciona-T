import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:acciona_t/registro/registro_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'inicio/inicio_widget.dart';
import 'reporte/reporte_widget.dart';
import 'menu/menu_widget.dart';
import 'tienda_escolar/tienda_escolar_widget.dart';
import 'credencial/credencial_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = ThemeMode.system;
  Stream<AccionaTFirebaseUser> userStream;
  AccionaTFirebaseUser initialUser;
  bool displaySplashImage = true;
  final authUserSub = authenticatedUserStream.listen((_) {});

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  void initState() {
    super.initState();
    userStream = accionaTFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acciona-T',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Container(
              color: FlutterFlowTheme.of(context).primaryBackground,
              child: Builder(
                builder: (context) => Image.asset(
                  'assets/images/Acciona.png',
                  fit: BoxFit.cover,
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : RegistroWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'Inicio';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Inicio': InicioWidget(),
      'Reporte': ReporteWidget(),
      'Menu': MenuWidget(),
      'Tienda_escolar': TiendaEscolarWidget(),
      'Credencial': CredencialWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: GNav(
        selectedIndex: currentIndex,
        onTabChange: (i) =>
            setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: Colors.white,
        color: FlutterFlowTheme.of(context).primaryColor,
        activeColor: FlutterFlowTheme.of(context).primaryColor,
        tabBackgroundColor: Color(0x34518EFB),
        tabBorderRadius: 30,
        tabMargin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
        padding: EdgeInsetsDirectional.fromSTEB(5, 16, 0, 16),
        gap: 8,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        duration: Duration(milliseconds: 800),
        haptic: false,
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            text: 'Inicio',
            iconSize: 24,
          ),
          GButton(
            icon: Icons.info_rounded,
            text: 'Reporte',
            iconSize: 20,
          ),
          GButton(
            icon: Icons.menu_rounded,
            text: 'Menú',
            iconSize: 20,
          ),
          GButton(
            icon: Icons.store_rounded,
            text: 'Tienda',
            iconSize: 20,
          ),
          GButton(
            icon: Icons.credit_card,
            text: 'Credencial',
            iconSize: 20,
          )
        ],
      ),
    );
  }
}
