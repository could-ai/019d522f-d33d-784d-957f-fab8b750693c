import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1100;
    return Row(
      children: [
        if (!isDesktop)
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        if (!isDesktop) const SizedBox(width: 16),
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search files...",
              fillColor: const Color(0xFF2A2D3E),
              filled: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2D3E),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white),
                radius: 16,
              ),
              if (isDesktop) const SizedBox(width: 8),
              if (isDesktop) const Text("Admin User"),
            ],
          ),
        )
      ],
    );
  }
}
