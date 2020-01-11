import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jaski_v4/providers/BannerCarousselProvider.dart';
import 'package:jaski_v4/providers/CategoryMenuProviders.dart';
import 'package:jaski_v4/src/screen/TabBar.dart';
import 'package:provider/provider.dart';
import 'package:jaski_v4/src/screen/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(

        // statusBarColor is used to set Status bar color in Android devices.
        statusBarColor: Colors.transparent,
        // To make Status bar icons color white in Android devices.
        statusBarIconBrightness: Brightness.light,

        // statusBarBrightness is used to set Status bar icon color in iOS.
        statusBarBrightness: Brightness.light
        // Here light means dark color Status bar icons.

        ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BannerCaroussel>(
          create: (_) => BannerCaroussel(),
        ),
        ChangeNotifierProvider<CategoryMenuProviders>(
          create: (_) => CategoryMenuProviders(),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: Color(0XFF126e83),
              accentColor: Colors.yellow),
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          home: TabBarJaski()),
    );
  }
}
