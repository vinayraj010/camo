import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  final int index;
  const NavigationState({required this.index});
  @override
  List<Object> get props => [index];
}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(index: 0));

  void updateIndex(int newIndex) {
    if (newIndex == state.index) {
      emit(const NavigationState(index: -1)); // Force rebuild
      emit(NavigationState(index: newIndex)); // Restore
    } else {
      emit(NavigationState(index: newIndex));
    }
  }
}

