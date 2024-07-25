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
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            children: [
              const CampusPage(),
              ChannelsPage(),
              const AudioPage(),
              const RewardsPage(),
              const NotificationsPage(),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigationBar(
              selectedIndex: selectedIndex,
              onItemTapped: onItemTapped,
            ),
          ),
        ],
      ),
      floatingActionButton: selectedIndex == 0
          ? Transform.translate(
              offset: const Offset(0, -70),
              child: FloatingActionButton(
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
              ),
            )
          : null,
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(
              horizontal: BorderSide(color: AppColors.borderGrey, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(AppImages.campus, 'Campus', 0),
          _buildNavItem(AppImages.channels, 'Channels', 1),
          _buildNavItem(AppImages.audio, 'Audio', 2),
          _buildNavItem(AppImages.rewards, 'Rewards', 3),
          _buildNavItem(AppImages.notifications, 'Notifications', 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(String icon, String label, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Stack(
        children: [
          if (selectedIndex == index)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 4,
                decoration: const BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4))),
              ),
            ),
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  color: selectedIndex == index
                      ? AppColors.primaryGreen
                      : AppColors.buttonGrey,
                ),
                Text(
                  label,
                  style: TextStyle(
                      color: selectedIndex == index
                          ? AppColors.primaryGreen
                          : AppColors.buttonGrey,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
