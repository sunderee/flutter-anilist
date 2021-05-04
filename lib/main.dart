import 'package:c2sanilist/blocs/summary/summary.bloc.dart';
import 'package:c2sanilist/blocs/summary/summary.dart';
import 'package:c2sanilist/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<SummaryBloc>(
          create: (_) => SummaryBloc()..add(SummaryEvent.retrieve(1, 50)),
          lazy: true,
        ),
      ],
      child: App(),
    ),
  );
}
