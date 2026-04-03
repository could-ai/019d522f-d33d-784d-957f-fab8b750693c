import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF2A2D3E),
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.analytics, size: 48, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: 8),
                const Text("DataDash AI", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard, color: Colors.white),
            title: const Text("Dashboard", style: TextStyle(color: Colors.white)),
            selected: true,
            selectedTileColor: Colors.blue.withOpacity(0.1),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.file_present, color: Colors.white54),
            title: const Text("Process Files", style: TextStyle(color: Colors.white54)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart, color: Colors.white54),
            title: const Text("Analytics", style: TextStyle(color: Colors.white54)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white54),
            title: const Text("Settings", style: TextStyle(color: Colors.white54)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
