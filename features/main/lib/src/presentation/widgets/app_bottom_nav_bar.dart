import 'package:flutter/material.dart';
import 'package:main/src/presentation/widgets/widgets.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar(
      {required this.items,
      required this.selectedIndex,
      required this.onSelectedIndex,
      super.key});

  final List<ItemAppBottomNavigation> items;
  final int selectedIndex;
  final Function(int) onSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          items.length,
          (index) => ItemAppBottomNavigation(
            iconAsset: items[index].iconAsset,
            isActive: selectedIndex == index,
            title: items[index].title,
            onPressed: () => onSelectedIndex(index),
          ),
        ),
      ),
    );
  }
}
