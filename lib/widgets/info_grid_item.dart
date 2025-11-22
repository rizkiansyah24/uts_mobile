import 'package:flutter/material.dart';

class InfoGridItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const InfoGridItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<InfoGridItem> createState() => _InfoGridItemState();
}

class _InfoGridItemState extends State<InfoGridItem>
    with SingleTickerProviderStateMixin {
  double scale = 1.0;

  void triggerPop() async {
    setState(() => scale = 1.08); // membesar
    await Future.delayed(const Duration(milliseconds: 120));
    setState(() => scale = 1.0); // kembali normal

    await Future.delayed(const Duration(milliseconds: 80));

    widget.onTap(); // jalankan modal
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: triggerPop,
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2416F0),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(0, 4),
                blurRadius: 8,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, color: Colors.white, size: 28),
              const SizedBox(height: 8),
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
