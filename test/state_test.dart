import 'package:provider_sample/state.dart';
import 'package:test/test.dart';

// 理想のコードであり、動きません!!
// notifierでWidgetを返すメソッドで定義できた場合のテストコード
// aya-eiya) 以下ではだめですか？
void main() {
  test('my first unit test', () {
    var notifier = AppStateNotifier();
    expect((notifier..up()).state.countState, 1);
  });
}
