import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/models/breadcrumb.dart';

import '../main.dart';

class NewBreadCrumbView extends StatefulWidget {
  const NewBreadCrumbView({super.key});

  @override
  State<NewBreadCrumbView> createState() => _NewBreadCrumbViewState();
}

class _NewBreadCrumbViewState extends State<NewBreadCrumbView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add a new bread crumb'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Enter a breadcrumb'),
            ),
            TextButton(
              onPressed: () {
                final text = _controller.text;
                if (text.isNotEmpty) {
                  final breadCrumb = Breadcrumb(
                    isActive: false,
                    name: text,
                  );
                  context.read<BreadCrumbProvider>().add(breadCrumb);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        ));
  }
}
