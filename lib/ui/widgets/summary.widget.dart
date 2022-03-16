import 'package:c2sanilist/api/models/summary.model.dart';
import 'package:c2sanilist/blocs/details/details.cubit.dart';
import 'package:c2sanilist/ui/screens/details.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryWidget extends StatelessWidget {
  final SummaryModel data;

  const SummaryWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          BlocProvider.of<DetailsCubit>(context).retrieveDetails(data.id);
          DetailsScreen.navigateTo(context);
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 6 / 4,
                  child: Image.network(data.mediaURL, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    left: 24.0,
                    right: 24.0,
                  ),
                  child: Text(
                    data.title,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12.0,
                    left: 24.0,
                    right: 24.0,
                  ),
                  child: Text(
                    data.description,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withAlpha(235),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
