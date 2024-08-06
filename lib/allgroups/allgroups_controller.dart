// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatbekat/allgroups/allgroups_service.dart';
import 'package:tatbekat/models/group.dart';

class AllGroupsController extends GetxController {
  final AllGroupsService _allgroupsService = AllGroupsService();
  final allgroups = <Group>[].obs;

  Future<void> fetchAllGroups() async {
    try {
      final fetchedOrders = await _allgroupsService.getAllgroups();
      allgroups.value = fetchedOrders;
    } catch (error) {
      print('Error fetching orders: $error');
    }
  }

  Future<void> deleteGroup(int orderId, String token) async {
    try {
      await _allgroupsService.deletegroup(orderId, token);
      print(_allgroupsService.status.toString());
      if (_allgroupsService.status == 200) {
        allgroups.removeWhere((group) => group.id == orderId);
      }
    } catch (error) {
      print('Error deleting orders: $error');
    }
  }

  var group_name;

  AllGroupsService allgroupsServices = AllGroupsService();

  addGroupOnClick() async {
    final success = await allgroupsServices.createGroup(group_name);
    if (success) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: const Text('Group Added Successfully ^-^'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          elevation: 6,
          action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
            },
          ),
        ),
      );
    } else {
      print('Error adding group');
    }
  }
}
