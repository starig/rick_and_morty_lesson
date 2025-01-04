import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_lesson/config/helpers.dart';
import 'package:rick_and_morty_lesson/features/components/circle_back_button.dart';
import 'package:rick_and_morty_lesson/features/details/components/details_item.dart';
import 'package:rick_and_morty_lesson/features/details/state/details_cubit.dart';
import 'package:rick_and_morty_lesson/gen/assets.gen.dart';
import 'package:rick_and_morty_lesson/models/character/character.dart';

class DetailsView extends StatefulWidget {
  final int id;

  const DetailsView({
    super.key,
    required this.id,
  });

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late final _detailFuture;

  static const double _leadingWidth = 76;
  static const double _horizontalPadding = 20;
  static const double _expandedHeight = 260;
  static const double _loaderSize = 40;

  @override
  initState() {
    _detailFuture = context.read<DetailsCubit>().getDetail(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _detailFuture,
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return BlocBuilder<DetailsCubit, DetailsState>(
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
                            await context.read<DetailsCubit>().getDetail(widget.id);
                          },
                          child: Text("Try again"),
                        )
                      ],
                    );
                  }
                  final Character character = state.details!;
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        leadingWidth: _leadingWidth,
                        leading: Padding(
                          padding: EdgeInsets.only(
                            left: _horizontalPadding,
                          ),
                          child: CircleBackButton(),
                        ),
                        expandedHeight: _expandedHeight,
                        flexibleSpace: SizedBox.expand(
                          child: Image.network(
                            character.image,
                            fit: BoxFit.cover,
                            frameBuilder: (BuildContext context, Widget child, int? frame,
                                bool wasSyncLoaded) {
                              if (wasSyncLoaded || frame != null) {
                                return Container(
                                  child: child,
                                );
                              } else {
                                return Center(
                                  child: SizedBox(
                                    height: _loaderSize,
                                    width: _loaderSize,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                );
                              }
                            },
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: SizedBox(
                                    height: _loaderSize,
                                    width: _loaderSize,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? getImageLoadingProgress(loadingProgress)
                                            : 0,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                          horizontal: _horizontalPadding,
                        ),
                        sliver: SliverList.list(
                          children: [
                            DetailsItem(
                              iconPath: Assets.images.information.path,
                              label: 'Name',
                              value: character.name.toLabelCase(),
                            ),
                            DetailsItem(
                              iconPath: getCharacterStatusIconPath(character.status),
                              label: 'Status',
                              value: character.status.name.toLabelCase(),
                            ),
                            DetailsItem(
                              iconPath: getCharacterSpeciesIconPath(character.species),
                              label: 'Species',
                              value: character.species.name.toLabelCase(),
                            ),
                            DetailsItem(
                              iconPath: getCharacterGenderIconPath(character.gender),
                              label: 'Gender',
                              value: character.gender.name.toLabelCase(),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              );
            }
            return Container();
          }),
    );
  }
}
