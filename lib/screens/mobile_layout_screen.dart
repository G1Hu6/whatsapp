import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/screens/calls_page.dart';
import 'package:whatsapp_ui/screens/chats_page.dart';
import 'package:whatsapp_ui/screens/communities_page.dart';
import 'package:whatsapp_ui/screens/update_page.dart';

class MobileLayoutScreen extends StatefulWidget {
  const MobileLayoutScreen({super.key});

  @override
  State<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends State<MobileLayoutScreen> {
  int selectedIndex = 0;
  PageController pageController = PageController();
  final List appBarTitles = [
    'WhatsApp',
    'Updates',
    'Communities',
    'Calls',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarColor,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Text(
          appBarTitles[selectedIndex],
          style: const TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        children: const [
          ChatsPage(),
          UpdatePage(),
          CommunitiesPage(),
          CallsPage()
        ],
      ),
      floatingActionButton: (selectedIndex != 2)
          ? FloatingActionButton(
              onPressed: () {},
              backgroundColor: primaryColor,
              child: IndexedStack(
                index: selectedIndex,
                children: const [
                  Icon(
                    Icons.add_comment_rounded,
                    color: appBarColor,
                  ),
                  Icon(
                    Icons.camera_alt_rounded,
                    color: appBarColor,
                  ),
                  Icon(
                    Icons.add_comment_rounded,
                    color: appBarColor,
                  ),
                  Icon(
                    Icons.add_ic_call_rounded,
                    color: appBarColor,
                  ),
                ],
              ))
          : null,
      bottomNavigationBar: NavigationBar(
          indicatorColor: primaryColor.withOpacity(0.15),
          backgroundColor: backgroundColor,
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
              pageController.animateToPage(selectedIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            });
          },
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(Icons.chat),
                icon: Icon(Icons.chat_outlined),
                label: "Chats"),
            NavigationDestination(
                selectedIcon: Icon(Icons.data_usage),
                icon: Icon(Icons.data_usage_outlined),
                label: "Updates"),
            NavigationDestination(
                selectedIcon: Icon(Icons.people_outline),
                icon: Icon(Icons.people_outline_outlined),
                label: "Communities"),
            NavigationDestination(
                selectedIcon: Icon(Icons.call),
                icon: Icon(Icons.call_outlined),
                label: "Calls"),
          ]),
    );
  }
}
