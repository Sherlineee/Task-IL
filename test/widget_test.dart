import 'package:flutter_test/flutter_test.dart';
import 'package:task_2_il_dart_function/main.dart';

void main() {
  testWidgets('App loads test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Cek apakah judul muncul
    expect(find.text('Dart Function Types'), findsOneWidget);
  });
}