import 'package:Zetafit/core/guards/app_guards.dart';
import 'package:Zetafit/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Zetafit/core/state/providers/theme_provider.dart';
import 'package:Zetafit/core/theme/app_theme.dart';

// 🔀 GLOBAL ROUTER

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      title: 'ZetaFit',
      debugShowCheckedModeBanner: false,

      // 🎨 THEMING
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,

      // 🚦 ROUTING
      home: const AppGuard(),
      onGenerateRoute: AppRouter.generate,

      // 🛡️ SAFETY
      onUnknownRoute: (_) => MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('Route not found'))),
      ),
    );
  }
}
