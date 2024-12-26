import 'package:flutter/material.dart';
import 'package:rick_and_morty_lesson/config/router.dart';
import 'package:rick_and_morty_lesson/config/theme.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rick And Morty',
      theme: theme,
      routerConfig: AppRouterHelper.router,
    );
  }
}
