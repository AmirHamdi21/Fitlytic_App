import 'package:bloc/bloc.dart';
import '../data/exercise_repository.dart';
import 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  final ExerciseRepository repository;

  ExerciseCubit(this.repository) : super(ExerciseInitial());

  void fetchExercises() async {
    emit(ExerciseLoading());
    try {
      final response = await repository.fetchExercises();
      emit(ExerciseLoaded(response.exercises));
    } catch (e) {
      emit(ExerciseError(e.toString()));
    }
  }
}
