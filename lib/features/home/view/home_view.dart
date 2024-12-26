import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_lesson/config/constants.dart';
import 'package:rick_and_morty_lesson/models/character/character.dart';
import 'package:rick_and_morty_lesson/models/character_response/character_response.dart';
import 'package:rick_and_morty_lesson/services/rick_and_morty_api/api.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              final CharacterResponse response =
                  await RickAndMortyApiClient(dio, baseUrl: AppConstants.rickAndMortyApiUrl)
                      .getCharacters();
              response.results.forEach((Character character) {});
              // inspect(response);
            } catch (e) {
              inspect(e);
            }
          },
          child: Text("Get characters"),
        ),
      ),
    );
  }
}
