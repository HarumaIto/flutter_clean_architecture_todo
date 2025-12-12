import 'package:clean_architecture_todo/ui/state/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() {
    return const HomeState();
  }

  void onPageChanged(int index) {
    state = state.copyWith(pageIndex: index);
  }
}
