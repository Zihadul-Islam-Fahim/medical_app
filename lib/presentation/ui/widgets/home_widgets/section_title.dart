import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isAll;

   const SectionTitle({
    super.key,
    required this.title,
    required this.onTap,
    required this.isAll
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: 'mn',
          ),
        ),
     isAll==false ?   TextButton(
          onPressed: onTap,
          child: const Text(
            'See all',
            style: TextStyle(
              fontFamily: 'mn',
              fontWeight: FontWeight.bold
            ),
          ),
        ) : const SizedBox()
      ],
    );
  }
}
