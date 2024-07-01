import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared/component/atom/app_textfield.dart';
import 'package:shared/shared.dart';

class AppDropdownField extends StatelessWidget {
  const AppDropdownField({
    required this.dropdownItems,
    required this.controller,
    super.key,
  });

  final List<String> dropdownItems;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton(
        underline: Container(),
        borderRadius: BorderRadius.circular(8),
        isExpanded: true,
        // value: dropdownItems.first,
        hint: Text(
          'Pilih',
          style: TextStyle(
            color: Colors.blueGrey.shade500.withOpacity(.5),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        items: dropdownItems.map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          controller.text = newValue ?? '';
        },
      ),
    );
  }
}
