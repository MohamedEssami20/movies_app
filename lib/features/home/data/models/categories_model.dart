import 'package:flutter/material.dart';

class CategoriesModel {
  final String title;
  final IconData? icon;

  CategoriesModel({
    required this.title,
    this.icon,
  });

  static List<CategoriesModel> categories = [
    CategoriesModel(
      title: 'All Categories',
      icon: Icons.category,
    ),
    CategoriesModel(
      title: 'Action',
    ),
    CategoriesModel(
      title: 'Adventure',
    ),
    CategoriesModel(
      title: 'Comedy',
    ),
    CategoriesModel(
      title: "Crime",
    ),
    CategoriesModel(
      title: "Animation",
    ),
    CategoriesModel(
      title: 'Drama',
    ),
    CategoriesModel(
      title: 'Family',
    ),
    CategoriesModel(
      title: 'Horror',
    ),
    CategoriesModel(
      title: 'Romance',
    ),
  ];
}
