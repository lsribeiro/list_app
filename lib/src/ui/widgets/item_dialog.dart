import 'package:flutter/material.dart';

class ItemDialog extends StatelessWidget {
  const ItemDialog({
    required this.titleTextController,
    required this.descriptionTextController,
    required this.onComplete,
    required this.completeButtonText,
    this.height,
    super.key,
  });

  final TextEditingController titleTextController;
  final TextEditingController descriptionTextController;
  final VoidCallback onComplete;
  final String completeButtonText;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: height,
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Title'),
              controller: titleTextController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Description'),
              controller: descriptionTextController,
            ),
            const Spacer(),
            InkWell(
              onTap: onComplete,
              child: Text(
                completeButtonText,
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'Oswald',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
