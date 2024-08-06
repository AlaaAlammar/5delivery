// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:tatbekat/models/report.dart';
import 'package:tatbekat/report/report_service.dart';

class ReportController extends GetxController {
  final ReportService _reportService = ReportService();
  final reports = <Report>[].obs;

  Future<void> fetchReport() async {
    try {
      final fetchedReport = await _reportService .getReport();
      reports.value = fetchedReport;
    } catch (error) {
      print('Error fetching report: $error');
    }
  }
}
