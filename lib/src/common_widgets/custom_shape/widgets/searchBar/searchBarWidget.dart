import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class searchBarWidget extends StatelessWidget {
  const searchBarWidget({
    super.key, required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey)
        ),
        child: Row(
          children: [
            const Icon(Iconsax.search_normal, color: Colors.grey,),
            const SizedBox(width: 15,),
            Text(text, style: const TextStyle(color: Colors.grey))
          ],
        ),
      ),
    );
  }
}
