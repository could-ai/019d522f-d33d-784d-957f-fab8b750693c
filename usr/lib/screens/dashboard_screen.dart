import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/header.dart';
import '../widgets/summary_cards.dart';
import '../widgets/chart_section.dart';
import '../widgets/recent_files.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1100;
    
    return Scaffold(
      drawer: !isDesktop ? const Sidebar() : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isDesktop)
              const Expanded(
                flex: 2,
                child: Sidebar(),
              ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Header(),
                    const SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SummaryCards(),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    children: [
                                      const ChartSection(),
                                      const SizedBox(height: 16),
                                      const RecentFiles(),
                                    ],
                                  ),
                                ),
                                if (isDesktop) const SizedBox(width: 16),
                                if (isDesktop)
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF2A2D3E),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "File Processing Details",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Text(
                                            "Select a file from the list to view its detailed processing results, extracted data, and AI analysis.",
                                            style: TextStyle(color: Colors.white54, height: 1.5),
                                          ),
                                          SizedBox(height: 24),
                                          Center(
                                            child: Icon(
                                              Icons.analytics_outlined,
                                              size: 64,
                                              color: Colors.white24,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
