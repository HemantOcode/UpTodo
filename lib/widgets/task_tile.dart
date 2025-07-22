import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uptodo/core/theme/theme.dart';

class TaskTile extends StatefulWidget {
  final String title;
  final DateTime? date;
  final bool initialChecked;
  final ValueChanged<bool>? onChanged;
  final VoidCallback? onDelete;

  const TaskTile({
    super.key,
    required this.title,
    required this.date,
    this.initialChecked = false,
    this.onChanged,
    this.onDelete,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialChecked;
  }

  @override
  Widget build(BuildContext context) {
    final dateText = widget.date != null
        ? DateFormat.yMMMd().format(widget.date!)
        : null;

    return GestureDetector(
      onTap: () {
        setState(() => _isChecked = !_isChecked);
        widget.onChanged?.call(_isChecked);
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Delete Task'),
            content: const Text('Are you sure you want to delete this task?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  widget.onDelete?.call();
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.tilebg,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Transform.scale(
              scale: 1.3,
              child: Checkbox(
                activeColor: AppColors.transparent,
                checkColor: Colors.green,
                value: _isChecked,
                onChanged: (v) {
                  if (v == null) return;
                  setState(() => _isChecked = v);
                  widget.onChanged?.call(v);
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: AppFontSizes.medium,
                      fontWeight: FontWeight.w700,
                      decoration: _isChecked
                          ? TextDecoration.lineThrough
                          : null,
                      decorationColor: AppColors.text,
                      decorationThickness: 2.5,
                    ),
                  ),
                  if (dateText != null) ...[
                    Text(
                      dateText,
                      style: TextStyle(
                        fontSize: AppFontSizes.small,
                        color: AppColors.text.withOpacity(0.75),
                        decoration: _isChecked
                            ? TextDecoration.lineThrough
                            : null,
                        decorationColor: AppColors.text,
                        decorationThickness: 2.5,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
