import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/models/breadcrumb.dart';
import 'package:provider_course/widgets/bread_crumbs_widget.dart';

import 'views/new_bread_crumb_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BreadCrumbProvider(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
          routes: {
            '/new': (context) => const NewBreadCrumbView(),
          }),
    );
  }
}

class BreadCrumbProvider extends ChangeNotifier {
  final List<Breadcrumb> _items = [];
  UnmodifiableListView<Breadcrumb> get items => UnmodifiableListView(_items);

  void add(Breadcrumb breadCrumb) {
    for (final item in _items) {
      item.activate();
    }
    _items.add(breadCrumb);
    notifyListeners();
  }

  void reset() {
    _items.clear();
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Consumer<BreadCrumbProvider>(
              builder: (context, value, child) {
                return BreadCrumbsWidget(
                  breadCrumbs: value.items,
                );
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/new');
              },
              child: const Text('Add a new bread crumb'),
            ),
            TextButton(
              onPressed: () {
                context.read<BreadCrumbProvider>().reset();
              },
              child: const Text('Reset'),
            ),
          ],
        ));
  }
}
