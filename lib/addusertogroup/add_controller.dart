// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:tatbekat/addusertogroup/add_service.dart';
import 'package:tatbekat/models/allusers.dart';

class AllUsersController extends GetxController {
  final AllUsersService _allusersService = AllUsersService();

  final allusers = <AllUsers>[].obs;

  Future<void> fetchAllUsers() async {
    try {
      final fetchedUsers = await _allusersService.getAllusers();
      allusers.value = fetchedUsers;
    } catch (error) {
      print('Error fetching users: $error');
    }
  }

  Future<void> AddUser(int groupId, int userId, String token) async {
    try {
      await _allusersService.AddUser(groupId, userId, token);
      allusers.removeWhere((user) => user.id == userId);
    } catch (error) {
      print('Error adding user: $error');
    }
  }
}
