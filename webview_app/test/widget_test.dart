import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart';

void main() {
  testWidgets('WebViewPage smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that WebViewPage is in the widget tree.
    expect(find.byType(WebViewPage), findsOneWidget);
  });
}
