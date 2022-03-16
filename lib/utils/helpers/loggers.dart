import 'package:loggy/loggy.dart';

mixin BlocLoggy implements LoggyType {
  @override
  Loggy<LoggyType> get loggy => Loggy<BlocLoggy>('Bloc Loggy - $runtimeType');
}
