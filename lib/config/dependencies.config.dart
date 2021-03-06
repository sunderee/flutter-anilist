import 'package:c2sanilist/api/api.provider.dart';
import 'package:c2sanilist/api/repositories/details.repository.dart';
import 'package:c2sanilist/api/repositories/summary.repository.dart';
import 'package:c2sanilist/blocs/details/details.cubit.dart';
import 'package:c2sanilist/blocs/summary/summary.bloc.dart';
import 'package:c2sanilist/blocs/summary/summary.event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:loggy/loggy.dart';

final GetIt getIt = GetIt.instance;

void initializeDependencies() {
  Loggy.initLoggy();

  getIt.registerSingleton<ApiProvider>(ApiProvider());
  getIt.registerSingleton<ISummaryRepository>(SummaryRepository());
  getIt.registerSingleton<IDetailsRepository>(DetailsRepository());
}

MultiBlocProvider initializeBlocs({
  required Widget mainAppWidget,
}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<SummaryBloc>(
        create: (_) => SummaryBloc()..add(const RetrieveSummaryEvent(1, 50)),
      ),
      BlocProvider<DetailsCubit>(create: (_) => DetailsCubit()),
    ],
    child: mainAppWidget,
  );
}
