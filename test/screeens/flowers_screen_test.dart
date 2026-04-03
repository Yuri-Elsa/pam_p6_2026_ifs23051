// test/screeens/flowers_screen_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pam_p6_2026_ifs23051/core/theme/app_theme.dart';
import 'package:pam_p6_2026_ifs23051/core/theme/theme_notifier.dart';
import 'package:pam_p6_2026_ifs23051/data/dummy_data.dart';
import 'package:pam_p6_2026_ifs23051/features/flowers/flowers_screen.dart';

Widget buildFlowersTest() {
  final notifier = ThemeNotifier(initial: ThemeMode.light);
  final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (_, __) => const FlowersScreen()),
    GoRoute(path: '/flowers/:name', builder: (_, __) => const SizedBox()),
  ]);

  return ThemeProvider(
    notifier: notifier,
    child: MaterialApp.router(
      theme: AppTheme.lightTheme,
      routerConfig: router,
    ),
  );
}

void main() {
  group('FlowersScreen', () {
    testWidgets('merender tanpa error', (tester) async {
      await tester.pumpWidget(buildFlowersTest());
      await tester.pumpAndSettle();

      expect(find.byType(FlowersScreen), findsOneWidget);
    });

    testWidgets('menampilkan judul "Flowers" di AppBar', (tester) async {
      await tester.pumpWidget(buildFlowersTest());
      await tester.pumpAndSettle();

      expect(find.text('Flowers'), findsOneWidget);
    });

    testWidgets('menampilkan tombol search di AppBar', (tester) async {
      await tester.pumpWidget(buildFlowersTest());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('menampilkan semua bunga dari DummyData', (tester) async {
      await tester.pumpWidget(buildFlowersTest());
      await tester.pumpAndSettle();

      final flowers = DummyData.getFlowersData();
      // Cek nama bunga pertama tampil
      expect(find.text(flowers.first.nama), findsOneWidget);
    });

    testWidgets('menampilkan list bunga menggunakan ListView', (tester) async {
      await tester.pumpWidget(buildFlowersTest());
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('fungsi search memfilter bunga berdasarkan nama',
            (tester) async {
          await tester.pumpWidget(buildFlowersTest());
          await tester.pumpAndSettle();

          // Buka search
          await tester.tap(find.byIcon(Icons.search));
          await tester.pumpAndSettle();

          // Ketik query
          await tester.enterText(find.byType(TextField), 'Mawar Merah');
          await tester.pumpAndSettle();

          // Hanya Mawar Merah yang tampil
          expect(
            find.descendant(
              of: find.byType(ListView),
              matching: find.text('Mawar Merah'),
            ),
            findsOneWidget,
          );
          expect(find.text('Lavender'), findsNothing);
        });

    testWidgets('menampilkan pesan saat tidak ada hasil pencarian',
            (tester) async {
          await tester.pumpWidget(buildFlowersTest());
          await tester.pumpAndSettle();

          await tester.tap(find.byIcon(Icons.search));
          await tester.pumpAndSettle();

          // Query yang tidak ada hasilnya
          await tester.enterText(find.byType(TextField), 'xyzabc123');
          await tester.pumpAndSettle();

          expect(find.text('Tidak ada bunga ditemukan!'), findsOneWidget);
        });

    testWidgets('menutup search mereset daftar bunga', (tester) async {
      await tester.pumpWidget(buildFlowersTest());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Mawar Merah');
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      // Scroll ke bawah sampai data terakhir
      await tester.scrollUntilVisible(
        find.text(DummyData.getFlowersData().last.nama),
        500,
      );

      // Pastikan data terakhir tampil
      expect(
        find.text(DummyData.getFlowersData().last.nama),
        findsOneWidget,
      );
    });
  });
}