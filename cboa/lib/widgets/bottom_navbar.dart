import 'package:cboa/constants/constant.dart';
import 'package:cboa/screens/history_page.dart';
import 'package:cboa/screens/profile_page.dart';
import 'package:cboa/screens/swap_page.dart';
import 'package:cboa/screens/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
    late PageController _pageController;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              //physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: _listOfWidget,
            ),
          ),
        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar(
              backgroundColor: kContentColorLightTheme,
              onButtonPressed: onButtonPressed,
              iconSize: 26,
              activeColor: kPrimaryColor,
              inactiveColor: Colors.white.withOpacity(0.7),
              selectedIndex: selectedIndex,
              fontSize: 14,
              barItems: <BarItem>[
                BarItem(
                  icon: Icons.wallet_outlined,
                  title: 'Wallet',
                ),
                BarItem(
                  icon: Icons.compare_arrows_outlined,
                  title: 'Swap',
                ),
                BarItem(
                  icon: Icons.history,
                  title: 'History',
                ),
                BarItem(
                  icon: Icons.person_2_outlined,
                  title: 'Profile',
                ),
              ],
            ),
    );
  }
}


List<Widget> _listOfWidget = <Widget>[
  WalletPage(),
  SwapPage(),
  HistoryPage(),
  ProfilePage(),
];