import 'package:flutter/material.dart';

class HobbyItem extends StatefulWidget {
  final String text;

  const HobbyItem({super.key, required this.text});

  @override
  State<HobbyItem> createState() => _HobbyItemState();
}

class _HobbyItemState extends State<HobbyItem> {
  double scale = 1.0;

  void animatePop() async {
    setState(() => scale = 1.08);
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() => scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: animatePop,
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
          decoration: BoxDecoration(
            color: const Color(0xFF2416F0),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(0, 4),
                blurRadius: 8,
              ),
            ],
          ),
          child: Text(
            widget.text,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
