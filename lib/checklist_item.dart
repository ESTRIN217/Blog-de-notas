class ChecklistItem {
  final String id;
  String text;
  bool isChecked;

  ChecklistItem({
    required this.id,
    this.text = '',
    this.isChecked = false,
  });
}
