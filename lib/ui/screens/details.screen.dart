import 'package:c2sanilist/api/models/details.model.dart';
import 'package:c2sanilist/blocs/details/details.cubit.dart';
import 'package:c2sanilist/blocs/details/details.state.dart';
import 'package:c2sanilist/blocs/status.enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = '/details';
  static void navigateTo(BuildContext context) {
    Navigator.pushNamed(context, DetailsScreen.routeName);
  }

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (BuildContext context, DetailsState state) {
            if (state.status == StatusEnum.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == StatusEnum.failed) {
              return Center(child: Text(state.errorMessage ?? 'Unknown'));
            } else if (state.status == StatusEnum.successful &&
                state.data != null) {
              final data = state.data as DetailsModel;
              return NestedScrollView(
                headerSliverBuilder: (_, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      expandedHeight: MediaQuery.of(context).size.height / 4,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        background: Image.network(
                          data.mediaURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ];
                },
                body: SafeArea(
                  minimum: const EdgeInsets.all(16.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Text(
                        data.title.second != null
                            ? '${data.title.first} (${data.title.second})'
                            : data.title.first,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${data.type}, ${data.format} | ${data.genres.join(', ')}',
                      ),
                      const SizedBox(height: 16.0),
                      data.duration != null
                          ? ListTile(
                              leading: const Icon(Icons.timelapse),
                              title: Text('${data.duration} minutes'),
                            )
                          : const SizedBox(),
                      data.episodes != null
                          ? ListTile(
                              leading: const Icon(Icons.list),
                              title: Text('${data.episodes} episodes'),
                            )
                          : const SizedBox(),
                      const Divider(),
                      Text(data.description),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Text('Application error, ${state.runtimeType}'),
              );
            }
          },
        ),
      );
}
