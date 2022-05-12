import 'package:flutter/material.dart';

class Utils {
  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text('Loading...'),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void showDialogMessage({
    required BuildContext context,
    String title = 'Thông báo',
    String? description = '',
    VoidCallback? onPressed,
  }) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                description ?? '',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Okay',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
