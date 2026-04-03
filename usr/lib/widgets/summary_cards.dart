import 'package:flutter/material.dart';

class SummaryCards extends StatelessWidget {
  const SummaryCards({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1100;
    final isTablet = MediaQuery.of(context).size.width >= 650 && MediaQuery.of(context).size.width < 1100;
    
    return GridView.count(
      crossAxisCount: isDesktop ? 4 : (isTablet ? 4 : 2),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: isDesktop ? 1.5 : 1.2,
      children: [
        _buildCard(context, "Total Files", "1,234", Icons.file_copy, Colors.blue),
        _buildCard(context, "Processed", "856", Icons.check_circle, Colors.green),
        _buildCard(context, "Pending", "378", Icons.pending, Colors.orange),
        _buildCard(context, "Errors", "12", Icons.error, Colors.red),
      ],
    );
  }

  Widget _buildCard(BuildContext context, String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2D3E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color),
              ),
              const Icon(Icons.more_vert, color: Colors.white54),
            ],
          ),
          Text(title, style: const TextStyle(color: Colors.white54)),
          Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
