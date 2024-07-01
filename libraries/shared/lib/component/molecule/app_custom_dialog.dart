import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class AppCustomDialog extends StatelessWidget {
  const AppCustomDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
    this.actionsHorizontal,
  });

  final String title;
  final String content;
  final List<Widget>? actions;
  final List<Widget>? actionsHorizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Styles.textMBold,
              ),
              10.ph(),
              Text(
                content,
                style: Styles.textMRegular,
              ),
              15.ph(),
              if (actions != null)
                ...actions!.map((e) => e)
              else
                Row(
                  children: [...actionsHorizontal!.map((e) => e)],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
