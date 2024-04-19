import 'package:eisenhowermatrix/util/color.util.dart';
import 'package:eisenhowermatrix/views/home.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:omegainc_lib/omegalibconfig.dart';

import 'consts/consts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    OmegaLibConfig.enabledBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black38, width: 0.5),
      borderRadius: BorderRadius.all(Radius.circular(10.5)),
    );

    OmegaLibConfig.focusedBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black45, width: 0.0),
      borderRadius: BorderRadius.all(Radius.circular(10.5)),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Consts.appTitle,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeView(),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("pt"),
        Locale("pt_BR"),
      ],
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: ColorUtil.genMaterialColor(Consts.primaryColor),
          accentColor: Consts.secondaryColor,
          brightness: Brightness.light,
        ),
      ),
    );
  }
}

