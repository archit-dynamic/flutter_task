import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/custom_text.dart';
import 'package:singhania_edu_flutter_task/modules/audio/audio.dart';
import 'package:singhania_edu_flutter_task/modules/campus/campus.dart';
import 'package:singhania_edu_flutter_task/modules/channels/channels.dart';
import 'package:singhania_edu_flutter_task/modules/notifications/notifications.dart';
import 'package:singhania_edu_flutter_task/modules/rewards/rewards.dart';
import 'package:singhania_edu_flutter_task/utils/app_colors.dart';
import 'package:singhania_edu_flutter_task/utils/app_images.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  final List<String> bottomNavLabels = [
    'Campus',
    'Channels',
    'Audio',
    'Rewards',
    'Notifications'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow.withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: AppColors.white,
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(AppImages.profile0),
                ),
                const SizedBox(
                  width: 12,
                ),
                CustomText(
                  text: bottomNavLabels[selectedIndex],
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppImages.search),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppImages.speechBubble2),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: const [
          CampusPage(),
          ChannelsPage(),
          AudioPage(),
          RewardsPage(),
          NotificationsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: [
          buildBottomNavigationBarItem(Icons.home, 'Campus'),
          buildBottomNavigationBarItem(Icons.search, 'Channels'),
          buildBottomNavigationBarItem(Icons.notifications, 'Audio'),
          buildBottomNavigationBarItem(Icons.message, 'Rewards'),
          buildBottomNavigationBarItem(Icons.person, 'Notifications'),
        ],
      ),
      floatingActionButton: selectedIndex == 0
          ? FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000)),
              onPressed: () {},
              backgroundColor: AppColors.primaryGreen,
              tooltip: 'Add',
              child: const Icon(
                Icons.add,
                size: 35,
                color: AppColors.white,
              ),
            )
          : null,
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          Icon(icon),
          if (selectedIndex == bottomNavLabels.indexOf(label))
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 5,
                color: Colors.blue,
              ),
            ),
        ],
      ),
      label: label,
    );
  }
}
