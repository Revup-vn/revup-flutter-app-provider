import 'package:flutter_test/flutter_test.dart';

import 'package:revup_provider/login/view/login_page.dart';

void main() {
  group('App', () {
    testWidgets('renders Login', (tester) async {
      await tester.pumpWidget(const LoginPage());
      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
