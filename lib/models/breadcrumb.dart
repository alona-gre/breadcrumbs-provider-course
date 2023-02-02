import 'package:uuid/uuid.dart';

class Breadcrumb {
  bool isActive;
  final String name;
  final String uuid;

  Breadcrumb({
    required this.isActive,
    required this.name,
  }) : uuid = const Uuid().v4();

  void activate() {
    isActive = true;
    print('is activated');
  }

  @override
  bool operator ==(covariant Breadcrumb other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;

  String get title => name + (isActive ? ' > ' : '');
}
