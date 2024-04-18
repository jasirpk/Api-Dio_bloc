import 'package:bloc/bloc.dart';
import 'package:bloc_api/respository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(isApiFetching: false)) {
    on<HomeEvent>((event, emit) async {
      emit(HomeState(isApiFetching: true));
      final data = await HomeRepository.fetchRandomApi();
      emit(HomeState(isApiFetching: false, result: data));
    });
  }
}
