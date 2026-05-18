// Arama metin alanı - TextField sarmalayıcısı.
// Dışarıdan controller ve onChanged alır, durum tutmaz (Stateless).

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.hintText = 'Ürün ara...',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.textSecondary,
          size: 22,
        ),
        suffixIcon: controller.text.isEmpty
            ? null
            : IconButton(
                icon: const Icon(Icons.close,
                    color: AppColors.textSecondary, size: 20),
                onPressed: () {
                  controller.clear();
                  onChanged('');
                },
              ),
      ),
    );
  }
}
