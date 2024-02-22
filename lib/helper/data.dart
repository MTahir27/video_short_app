import 'package:flutter/material.dart';

import '../models/bottom_navigation_bar_modal.dart';
import '../models/onboarding_modal.dart';
import '../screens/add_screen.dart';
import '../screens/deals_screen.dart';
import '../screens/discover_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

// Onboarding Screen List
final List<OnboardingModal> onBoardingDataList = [
  OnboardingModal(
    title: 'Discover Great Deals',
    description:
        "Have something to sell? Just snap, upload, and price your items. We've made theprocess simple and quick. Get your items in front of buyers in no time!",
    image: 'assets/images/onboarding/slide-1.png',
  ),
  OnboardingModal(
    title: 'Effortless Selling',
    description:
        "Have something to sell? Just snap, upload, and price your items. We've made the process simple and quick. Get your items in front of buyers in no time!",
    image: 'assets/images/onboarding/slide-2.png',
  ),
  OnboardingModal(
    title: 'Promote Your Business',
    description:
        "Our platform is a powerful tool for businesses as well! Advertise your products or services to a large and engaged audience,",
    image: 'assets/images/onboarding/slide-3.png',
  ),
];

// Frontend Screen Tabs List
final List<BottomNavigationBarModal> frontendScreenTabsList = [
  BottomNavigationBarModal(
    index: 0,
    title: 'Home',
    icon: const Icon(Icons.home),
    page: const HomeScreen(),
  ),
  BottomNavigationBarModal(
    index: 1,
    title: 'Discover',
    icon: const Icon(Icons.search),
    page: const DiscoverScreen(),
  ),
  BottomNavigationBarModal(
    index: 2,
    title: 'Add',
    icon: const Icon(Icons.add),
    page: const AddScreen(),
    isButton: true,
  ),
  BottomNavigationBarModal(
    index: 3,
    title: 'Deals',
    icon: const Icon(Icons.south_america),
    page: const DealsScreen(),
  ),
  BottomNavigationBarModal(
    index: 4,
    title: 'Profile',
    icon: const Icon(Icons.person),
    page: const ProfileScreen(),
  ),
];
