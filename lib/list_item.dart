import 'checklist_item.dart';

enum SortMethod { custom, alphabetical, byDate }

class ListItem {
  final String id;
  final String title;
  final String summary;
  final DateTime lastModified;
  final List<ChecklistItem> checklist;
  final int? backgroundColor;
  final String? backgroundImagePath;
  final double? fontSize;
  final bool isBold;
  final bool isItalic;

  ListItem({
    required this.id,
    required this.title,
    required this.summary,
    required this.lastModified,
    this.checklist = const [],
    this.backgroundColor,
    this.backgroundImagePath,
    this.fontSize,
    this.isBold = false,
    this.isItalic = false,
  });
}
