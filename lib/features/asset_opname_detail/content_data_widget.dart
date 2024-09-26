import 'package:flutter/material.dart';

class ContentDataWidget extends StatelessWidget {
  final String title;
  final String content;
  const ContentDataWidget(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 8),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: Color(0xFFE6E7E8)),
            ),
          ),
          child: Text(
            content,
            style: const TextStyle(fontSize: 16, color: Color(0xFFbfbfbf)),
          ),
        )
      ],
    );
  }
}
