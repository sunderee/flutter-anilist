import 'package:meta/meta.dart';

@immutable
class Pair<A, B> {
  final A first;
  final B second;

  @literal
  const Pair(this.first, this.second);

  @override
  String toString() => 'Pair: $first, $second';
}
