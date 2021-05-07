import 'package:c2sanilist/api/models/summary.model.dart';
import 'package:c2sanilist/blocs/details/details.dart';
import 'package:c2sanilist/ui/screens/details.screen.dart';
import 'package:c2sanilist/utils/constants/color.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryWidget extends StatelessWidget {
  final SummaryModel data;

  const SummaryWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<DetailsBloc>(context).add(
          DetailsEvent.retrieve(data.id),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsScreen(),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          color: COLOR_BACKGROUND,
          padding: null,
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
                    color: COLOR_TEXT_PRIMARY,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
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
                    color: COLOR_TEXT_SECONDARY,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
