import 'package:flutter/material.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2D3E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recent Files Processed",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('File upload dialog would open here')),
                  );
                },
                icon: const Icon(Icons.upload_file),
                label: const Text("Upload New"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: 24,
                columns: const [
                  DataColumn(label: Text("File Name")),
                  DataColumn(label: Text("Date")),
                  DataColumn(label: Text("Size")),
                  DataColumn(label: Text("Status")),
                ],
                rows: [
                  _buildDataRow("data_export_q1.csv", "01 Mar 2024", "2.5 MB", "Completed", Colors.green),
                  _buildDataRow("user_logs_feb.json", "28 Feb 2024", "14.2 MB", "Processing", Colors.orange),
                  _buildDataRow("financial_report.pdf", "25 Feb 2024", "1.1 MB", "Failed", Colors.red),
                  _buildDataRow("inventory_list.xlsx", "20 Feb 2024", "5.8 MB", "Completed", Colors.green),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildDataRow(String name, String date, String size, String status, Color statusColor) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              const Icon(Icons.insert_drive_file, color: Colors.blueAccent, size: 20),
              const SizedBox(width: 8),
              Text(name),
            ],
          ),
        ),
        DataCell(Text(date)),
        DataCell(Text(size)),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(status, style: TextStyle(color: statusColor, fontSize: 12)),
          ),
        ),
      ],
    );
  }
}
