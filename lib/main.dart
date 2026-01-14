import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_colors.dart';
import 'data/mock/hydration_mock_db.dart';
import 'data/repository/hydration_repository.dart';
import 'cubit/analysis_cubit.dart';
import 'screens/analysis/analysis_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SipnudgeApp());
}

class SipnudgeApp extends StatelessWidget {
  const SipnudgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<HydrationRepository>(
      create: (_) => HydrationRepository(HydrationMockDb()),
      child: BlocProvider<AnalysisCubit>(
        create: (context) => AnalysisCubit(context.read<HydrationRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sipnudge',
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.black,
          ),
          home: const AnalysisScreen(),
        ),
      ),
    );
  }
}
