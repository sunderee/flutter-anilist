import 'package:c2sanilist/api/repositories/details.repository.dart';
import 'package:c2sanilist/api/repositories/summary.repository.dart';
import 'package:c2sanilist/blocs/details/details.dart';
import 'package:c2sanilist/blocs/summary/summary.dart';
import 'package:c2sanilist/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<SummaryBloc>(
          create: (_) => SummaryBloc(
            repository: SummaryRepository.instance(),
          )..add(SummaryEvent.retrieve(1, 50)),
          lazy: false,
        ),
        BlocProvider<DetailsBloc>(
          create: (_) => DetailsBloc(
            repository: DetailsRepository.instance(),
          ),
          lazy: true,
        )
      ],
      child: const App(),
    ),
  );
}
