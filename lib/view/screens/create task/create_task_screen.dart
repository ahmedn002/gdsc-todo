import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task_one/constants/assets.dart';
import 'package:task_one/constants/colors.dart';
import 'package:task_one/controllers/tasks_provider.dart';
import 'package:task_one/model/task.dart';
import 'package:task_one/view/screens/create%20task/components/title_sections.dart';
import 'package:task_one/view/screens/create%20task/components/todos_section.dart';
import 'package:task_one/view/widgets/actions/custom_button.dart';
import 'package:task_one/view/widgets/misc/custom_app_bar.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final List<TextEditingController> _todosControllers = [TextEditingController()]; // One initial to-do

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Create Task'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TitleSection(controller: _titleController),
              const Divider(
                color: AppColors.secondaryText,
                thickness: 1,
                height: 40,
              ),
              TodosSection(
                controllers: _todosControllers,
                onRemove: (int index) {
                  setState(() {
                    _todosControllers.removeAt(index);
                  });
                },
              ),
              const SizedBox(height: 15),
              CustomButton(
                text: 'Add',
                icon: SvgPicture.asset(AssetData.plusSvg),
                minimumSize: const Size(200, 45),
                onPressed: () {
                  setState(() {
                    _todosControllers.add(TextEditingController());
                  });
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: AppColors.accentDark,
          shape: const CircleBorder(),
          onPressed: () {
            if (!_formKey.currentState!.validate()) return;
            context.read<TasksProvider>().addTask(_createTask());
            Navigator.pop(context);
          },
          child: const Icon(Icons.check, color: AppColors.primaryText, size: 40),
        ),
      ),
    );
  }

  Task _createTask() {
    final List<TaskComponent> todos = [
      for (final controller in _todosControllers)
        TaskComponent(
          name: controller.text,
          isDone: false,
        ),
    ];

    return Task(
      title: _titleController.text,
      components: todos,
    );
  }
}
