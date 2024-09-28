import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final IconData icon;

  CategoryModel({required this.name, required this.icon});
}

List<CategoryModel> categories = [
  CategoryModel(name: 'Popular', icon: Icons.local_dining),
  CategoryModel(name: 'Cake', icon: Icons.cake),
  CategoryModel(name: 'Lunch', icon: Icons.lunch_dining),
  CategoryModel(name: 'Dinner', icon: Icons.dinner_dining),
  CategoryModel(name: 'Drink', icon: Icons.local_drink),
  CategoryModel(name: 'food', icon: Icons.fastfood),
];
