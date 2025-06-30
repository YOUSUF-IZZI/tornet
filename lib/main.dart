import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tornet/core/utils/app_them.dart';
import 'package:tornet/presentaion/bloc/matches_cubit.dart';
import 'package:tornet/presentaion/screens/match_table_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppTheme.updateStatusBarStyle(ThemeMode.dark);
  runApp(
    ProviderScope(
      child: BlocProvider(
        create: (context) => MatchesCubit(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const MatchTableScreen(),
    );
  }
}
