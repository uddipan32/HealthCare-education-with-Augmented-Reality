import 'package:flutter/material.dart';

class OrganItem with ChangeNotifier{
  OrganItem({
    this.id,
    this.name,
    this.category,
});
  final String id;
  final String name;
  final String category;
}

class Organs with ChangeNotifier{
  List<OrganItem> _allOrgans =[
    OrganItem(
      id: "armModel",
      name: "Arm Skeleton",
      category: "Skeletal"
    ),
    OrganItem(
      id: "brainModel",
      name: "Brain",
      category: "Nervous"
    ),
    OrganItem(
      id: "footModel",
      name: "Foot Skeleton",
      category: "Skeletal"
    ),
    OrganItem(
      id: "heartModel",
      name: "Heart",
      category: "Circulatory"
    ),
    OrganItem(
      id: "teethModel",
      name: "Teeth",
      category: "Skeletal"
    ),
    OrganItem(
      id: "skullModel",
      name: "skull",
      category: "Skeletal"
    ),
    OrganItem(
      id: "toothModel",
      name: "Tooth",
      category: "Skeletal",
    ),
    OrganItem(
      id: "lungsModel",
      name: "Lungs",
      category: "Respiratory",
    ),
    OrganItem(
      id: "kidneyModel",
      name: "Kidney",
      category: "Urinary",
    ),
    OrganItem(
      id: "digestiveModel",
      name: "Digestive System",
      category: "Digestive",
    ),

  ];

  List<OrganItem> get organs {
    return [...organs];
  }

  List<OrganItem> getOrgansByCat(String category){
    return _allOrgans.where((element) => element.category == category).toList();
  }

  List<OrganItem> getOrgans(String organ){
    return _allOrgans.where((element) => element.name.contains(RegExp(organ, caseSensitive: false ))).toList();
  }
}