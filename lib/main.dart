import 'package:chex_test_case/core/utility/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/_features_export.dart';
import 'features/home/viewmodel/home_viewmodel.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      builder: (context, child) {
         ScreenSize().screenSize=MediaQuery.of(context).size;
         return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: const HomePage(),
              );
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme:  AppBarTheme(color: Colors.purple[300],elevation: 0),
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const HomePage(),
    );
  }
}

