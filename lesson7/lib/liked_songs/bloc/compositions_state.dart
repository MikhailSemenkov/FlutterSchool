part of 'compositions_bloc.dart';

@immutable
abstract class CompositionsState {
  final List<Composition> compositions;

  const CompositionsState(this.compositions);
}

class CompositionsInitial extends CompositionsState {
  CompositionsInitial() : super([]);
}

class CompositionsLoading extends CompositionsState {
  CompositionsLoading() : super([]);
}

class CompositionsLoaded extends CompositionsState {
  const CompositionsLoaded(super.compositions);
}

class CompositionsError extends CompositionsState {
  CompositionsError() : super([]);
}
