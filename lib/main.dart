import 'package:flutter/material.dart';
import 'package:rick_and_morty_lesson/app.dart';
import 'package:rick_and_morty_lesson/config/router.dart';
import 'package:rick_and_morty_lesson/dependency_injection/app_component.dart';

void main() {
  configureDependencies();
  AppRouterHelper.instance;
  runApp(const RickAndMortyApp());
}
