import 'package:flutter/material.dart';

import '../models/product_modal.dart';
import '../models/onboarding_modal.dart';
import '../models/bottom_navigation_bar_modal.dart';
import '../screens/add_screen.dart';
import '../screens/home_screen.dart';
import '../screens/deals_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/discover_screen.dart';

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
    icon: Icons.home,
    page: const HomeScreen(),
  ),
  BottomNavigationBarModal(
    index: 1,
    title: 'Discover',
    icon: Icons.search,
    page: const DiscoverScreen(),
  ),
  BottomNavigationBarModal(
    index: 2,
    title: 'Add',
    icon: Icons.add,
    page: const AddScreen(),
    isButton: true,
  ),
  BottomNavigationBarModal(
    index: 3,
    title: 'Deals',
    icon: Icons.luggage_sharp,
    page: const DealsScreen(),
  ),
  BottomNavigationBarModal(
    index: 4,
    title: 'Profile',
    icon: Icons.person,
    page: const ProfileScreen(),
  ),
];

final List<UserProfileModal> userProfileLists = [
  UserProfileModal(
    id: 1,
    name: 'Electronics',
    image: 'assets/images/avatars/avatar-1.png',
  ),
  UserProfileModal(
    id: 2,
    name: 'Appliances',
    image: 'assets/images/avatars/avatar-2.png',
  ),
  UserProfileModal(
    id: 3,
    name: 'Mobiles',
    image: 'assets/images/avatars/avatar-3.png',
  ),
  UserProfileModal(
    id: 4,
    name: 'I Phones',
    image: 'assets/images/avatars/avatar-4.png',
  ),
  UserProfileModal(
    id: 5,
    name: 'Tablets',
    image: 'assets/images/avatars/avatar-5.png',
  ),
  UserProfileModal(
    id: 6,
    name: 'Computer',
    image: 'assets/images/avatars/avatar-6.png',
  ),
];
