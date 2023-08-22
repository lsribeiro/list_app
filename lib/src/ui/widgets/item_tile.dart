import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    required this.title,
    required this.description,
    required this.onTapEdit,
    required this.onTapDelete,
    this.margin,
    super.key,
  });

  final String title;
  final String description;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(colors: [
            Color(0xFFcc89aa),
            Color(0xFFdbad8a),
          ])),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Oswald',
                  color: Colors.white,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: onTapEdit,
            child: const Icon(
              Icons.edit_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: onTapDelete,
            child: const Icon(
              Icons.delete_outline_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
