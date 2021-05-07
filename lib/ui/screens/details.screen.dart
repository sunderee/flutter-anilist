import 'package:c2sanilist/blocs/details/details.dart';
import 'package:c2sanilist/utils/constants/color.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (BuildContext cntx, DetailsState state) {
            if (state is LoadingDetailsState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FailedDetailsState) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is SuccessfulDetailsState) {
              final data = state.data;
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
                          color: COLOR_TEXT_PRIMARY,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${data.type}, ${data.format} | ${data.genres.join(', ')}',
                      ),
                      SizedBox(height: 16.0),
                      data.duration != null
                          ? ListTile(
                              leading: Icon(Icons.timelapse),
                              title: Text('${data.duration} minutes'),
                            )
                          : SizedBox(),
                      data.episodes != null
                          ? ListTile(
                              leading: Icon(Icons.list),
                              title: Text('${data.episodes} episodes'),
                            )
                          : SizedBox(),
                      Divider(),
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
