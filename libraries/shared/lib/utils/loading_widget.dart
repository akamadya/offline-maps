import 'package:flutter/material.dart';
import 'package:shared/preferences/preferences.dart';

class LoadingWidget {
  static bool _isLoading = false;

  static Future<void> show(BuildContext context) async {
    _isLoading = true;
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const LoadingPage(),
    );
  }

  static void hide(BuildContext context) {
    if (_isLoading) {
      Navigator.pop(context);
    }
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colors.white,
            ),
            const SizedBox(height: 15),
            Text(
              'Loading...',
              style: Styles.textMBold.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
