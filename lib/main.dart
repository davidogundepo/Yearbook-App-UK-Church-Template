import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:uk_church_template/notifier/church_arial_notifier.dart';
import './sidebar/sidebar_layout.dart';

import 'notifier/achievement_images_notifier.dart';
import 'notifier/pastors_notifier.dart';
import 'notifier/choir_notifier.dart';
import 'notifier/noblemen_network_notifier.dart';
import 'notifier/sidebar_notifier.dart';
import 'notifier/sanctuary_keepers_notifier.dart';
import 'notifier/media_unit_notifier.dart';
import 'notifier/evangelical_unit_notifier.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runZonedGuarded(() {
    runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PastorsNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => ChoirNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => MediaUnitNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => SanctuaryKeepersNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => EvangelicalUnitNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => NoblemenNetworkNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => AchievementsNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => ChurchArialNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => SideBarNotifier(),
          ),
        ],
        child: MyApp()
    ));
  }, FirebaseCrashlytics.instance.recordError);

}


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: SideBarLayout(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}
