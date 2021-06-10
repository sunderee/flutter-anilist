import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Pair<A, B> extends Equatable {
  final A first;
  final B second;

  @literal
  const Pair(this.first, this.second);

  @override
  List<Object?> get props => [first, second];
}
