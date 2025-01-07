import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_lesson/features/home/components/character_card.dart';
import 'package:rick_and_morty_lesson/features/home/state/home_cubit.dart';
import 'package:rick_and_morty_lesson/models/character/character.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<void> _future;
  final ScrollController _scrollController = ScrollController();

  static const double _verticalGap = 10;
  static const double _horizontalGap = 20;
  static const double _horizontalPadding = 20;

  @override
  void initState() {
    _future = context.read<HomeCubit>().getCharacters();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        if (!context.read<HomeCubit>().state.isAllLoaded) {
          await context.read<HomeCubit>().loadMoreCharacters();
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
          future: _future,
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (snapshot.hasError) {
                    return Column(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.errorMessage ?? 'Some error...',
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await context.read<HomeCubit>().getCharacters();
                          },
                          child: Text("Try again"),
                        )
                      ],
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      await context.read<HomeCubit>().getCharacters();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: _horizontalPadding,
                      ),
                      child: CustomScrollView(
                        controller: _scrollController,
                        slivers: [
                          SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                if (index <= (state.characters.length - 2)) {
                                  final character = state.characters[index];
                                  return CharacterCard(character: character);
                                } else {
                                  return Skeletonizer(
                                    child: CharacterCard(
                                      character: Character(
                                        id: 0,
                                        name: "Some long long long name",
                                        status: CharacterStatus.unknown,
                                        species: CharacterSpecies.other,
                                        type: 'Sometype',
                                        gender: CharacterGender.unknown,
                                        origin: Origin(name: 'name', url: 'url'),
                                        location: Location(name: 'name', url: 'url'),
                                        image: 'image',
                                        episode: [],
                                        url: 'url',
                                        created: DateTime.now(),
                                      ),
                                    ),
                                  );
                                }
                              },
                              childCount: state.characters.length + 2,
                            ),
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 215,
                              mainAxisSpacing: _verticalGap,
                              crossAxisSpacing: _horizontalGap,
                              childAspectRatio: 160 / 215,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
