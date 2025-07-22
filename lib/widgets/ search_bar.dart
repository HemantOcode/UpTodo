import 'package:flutter/material.dart';
import 'package:uptodo/core/theme/theme.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: AppColors.text),
      decoration: InputDecoration(
        hintText: 'Search tasks...',
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: AppColors.tilebg,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
      ),
    );
  }
}
