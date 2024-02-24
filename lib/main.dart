import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_one/constants/colors.dart';
import 'package:task_one/constants/routes.dart';
import 'package:task_one/view/screens/create%20task/create_task_screen.dart';
import 'package:task_one/view/screens/home/home.dart';

import 'controllers/tasks_provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TasksProvider()), // Injecting the TasksProvider into the widget tree.
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.background,
          primaryColor: AppColors.accentDark,
          colorScheme: const ColorScheme.dark(primary: AppColors.accent),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: AppColors.primaryText,
                displayColor: AppColors.primaryText,
              ),
        ),
        routes: {
          Routes.home: (context) => const HomeScreen(),
          Routes.createTask: (context) => const CreateTaskScreen(),
        },
      ),
    );
  }
}
