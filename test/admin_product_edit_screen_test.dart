import 'package:ehsan_store/screens/admin/product_edit/ProductEditScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('tester', (WidgetTester tester) async {
    await tester.pumpWidget(ProductEditScreen());

    expect(find.text('Poduct Edit'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Save'), findsOneWidget);
    expect(find.byIcon(Icons.remove), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    expect(find.byIcon(Icons.visibility), findsOneWidget);
    expect(find.byIcon(Icons.delete_forever_rounded), findsOneWidget);
    expect(find.byType(IconButton), findsNWidgets(4));
    expect(find.byType(TextButton), findsNWidgets(2));
    expect(find.byType(TextFormField), findsNWidgets(4));
  });
  testWidgets('submit to admin product detail screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(ProductEditScreen());
    final Finder submit = find.widgetWithText(ElevatedButton, 'Save');

    await tester.tap(submit);
    await tester.pump();

    Future.delayed(Duration(seconds: 2));
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
