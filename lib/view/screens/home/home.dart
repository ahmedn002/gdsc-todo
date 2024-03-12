import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:provider/provider.dart';
import 'package:task_one/constants/assets.dart';
import 'package:task_one/constants/colors.dart';
import 'package:task_one/controllers/tasks_provider.dart';
import 'package:task_one/model/task.dart';
import 'package:task_one/view/screens/home/components/your_tasks_section.dart';
import 'package:task_one/view/widgets/misc/custom_app_bar.dart';
import 'package:task_one/view/widgets/pinned task card/pinned_task_card.dart';

import 'components/greeting_section.dart';
import 'components/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _tasks.addAll(Task.mockUpTasks);
  }

  @override
  Widget build(BuildContext context) {
    // For the pie menu package to work
    return PieCanvas(
      theme: _pieTheme(),
      // Listening to the TasksProvider changes.
      child: Consumer<TasksProvider>(
        builder: (context, tasksProvider, _) {
          // We get the first pinned task from the tasks list.
          // We cast the list to Task? in order to be able to return null in the orElse callback.
          final Task? pinnedTask = tasksProvider.tasks.cast<Task?>().firstWhere(
                (task) => task!.isPinned,
                orElse: () => null,
              );

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: CustomAppBar(trailing: SvgPicture.asset(AssetData.settingsSvg)),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),
                  const SliverToBoxAdapter(child: GreetingSection()),
                  const SliverToBoxAdapter(child: SizedBox(height: 32)),
                  if (pinnedTask != null) SliverToBoxAdapter(child: PinnedTaskCard(task: pinnedTask)),
                  const SliverToBoxAdapter(child: SizedBox(height: 32)),
                  SliverToBoxAdapter(child: YourTasksSection(tasks: tasksProvider.tasks)),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  TaskList(tasks: tasksProvider.tasks),
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  PieTheme _pieTheme() => const PieTheme(
        brightness: Brightness.dark,
        pointerColor: Colors.transparent,
        radius: 65,
        rightClickShowsMenu: true,
        buttonTheme: PieButtonTheme(backgroundColor: AppColors.accentDark, iconColor: AppColors.primaryText),
        buttonThemeHovered: PieButtonTheme(backgroundColor: AppColors.elevation, iconColor: AppColors.primaryText),
      );
}
