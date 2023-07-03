import 'package:flutter/material.dart';

class ItemIndex extends StatelessWidget {
  const ItemIndex({
    super.key,
    required this.itemIndex,
    required this.correctItem,
  });
  final int itemIndex;
  final bool correctItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: correctItem ? Colors.blue : Colors.purple,
      ),
      child: Text(
        (itemIndex + 1).toString(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
