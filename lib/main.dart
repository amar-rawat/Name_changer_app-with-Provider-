import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_name_changer/pages/home_page.dart';
import 'package:provider_name_changer/pages/settings_page.dart';
import 'package:provider_name_changer/providers/all_providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NameProvider()),
        ChangeNotifierProvider(create: (context) => IndexProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          '/settings': (context) => const Settings(),
        },
      ),
    );
  }
}
