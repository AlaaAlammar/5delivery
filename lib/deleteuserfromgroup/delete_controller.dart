// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:tatbekat/deleteuserfromgroup/delete_service.dart';
import 'package:tatbekat/models/userwithpivot.dart';

class AllUsersByController extends GetxController {
  final AllUsersByService _allusersbyService = AllUsersByService();
  final allusersby = <UserWith>[].obs;

  Future<void> fetchAllUsersBy(int groupId) async {
    try {
      final fetchedUsers = await _allusersbyService.getAllusersby(groupId);
      allusersby.value = fetchedUsers;
    } catch (error) {
      print('Error fetching users by : $error');
    }
  }

  Future<void> deleteUser(int groupId,int userId, String token) async {
    try {
      await _allusersbyService.deleteUser(groupId,userId,token);
      allusersby.removeWhere((user) => user.id == userId);
    } catch (error) {
      print('Error deleting user: $error');
    }
  }
}
