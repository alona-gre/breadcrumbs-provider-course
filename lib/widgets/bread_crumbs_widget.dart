import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider_course/models/breadcrumb.dart';

class BreadCrumbsWidget extends StatelessWidget {
  final UnmodifiableListView<Breadcrumb> breadCrumbs;
  const BreadCrumbsWidget({
    Key? key,
    required this.breadCrumbs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadCrumbs.map((b) {
        return Text(
          b.title,
          style: TextStyle(
            color: b.isActive ? Colors.blue : Colors.black,
          ),
        );
      }).toList(),
    );
  }
}
