import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

class AppState {
  final int countState;

  factory AppState.initial() => AppState(
        countState: 0,
      );
  AppState({
    this.countState,
  });

  AppState copyWith({
    int countState,
    TextEditingController textState,
  }) {
    return AppState(
      countState: countState ?? this.countState,
    );
  }
}

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(AppState.initial());

  //TODO: AppStateを返すメソッドで定義したい。テストコードを書きやすくしたいから。
  // 理想的にはstateも引数で渡したい。
  void up() {
    state = state.copyWith(countState: state.countState + 1);
  }

  void down() {
    state = state.copyWith(countState: state.countState - 1);
  }
}
