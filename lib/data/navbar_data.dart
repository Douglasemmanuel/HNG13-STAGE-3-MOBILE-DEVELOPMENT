import 'package:flutter/material.dart';
import 'package:wallpapper_studio_app/utils/route_generator.dart';
import 'package:wallpapper_studio_app/models/navbar_models.dart';
final List<NavbarItem> navbarItems = [
  NavbarItem(
    icon: Icons.home_outlined,
    title: 'Home',
    link: RouteGenerator.initial,
  ),
  NavbarItem(
    icon: Icons.grid_on_outlined,
    title: 'Browse',
    link: RouteGenerator.browse,
  ),
  NavbarItem(
    icon: Icons.favorite_outline,
    title: 'Favorites',
    link: RouteGenerator.favourites,
  ),
  NavbarItem(
    icon: Icons.settings_outlined,
    title: 'Settings',
    link: RouteGenerator.setting,
  ),
];
