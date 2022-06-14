import 'package:flutter_test/flutter_test.dart';

import 'package:revup_provider/app/app.dart';
import 'package:revup_provider/test/test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(TestPage), findsOneWidget);
    });
  });
}
