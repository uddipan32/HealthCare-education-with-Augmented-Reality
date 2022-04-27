import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import './screens/organs_screen.dart';
import './screens/camera_screen.dart';

import './providers/organs.dart';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Organs())],
      child: MaterialApp(
        title: 'Medical Training',
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          accentColor: Colors.red,
          textTheme: TextTheme(
              bodyText1: TextStyle(color: Colors.deepPurple, fontSize: 50),
              headline3: TextStyle(color: Colors.white, fontSize: 25)),
          dialogTheme: DialogTheme(
            backgroundColor: Colors.deepPurple,
            contentTextStyle: TextStyle(color: Colors.white, fontSize: 16),
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: HomeScreen(),
        // debugShowCheckedModeBanner: false,
        routes: {
          OrgansScreen.routeName:(ctx)=> OrgansScreen(),
          CameraScreen.routeName:(ctx) => CameraScreen(),
        },
      ),
    );
  }
}
