//import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/ui/widgets/task_item_card.dart';

class Urls {
  static final String _baseUrl = "https://task.teamrabbil.com/api/v1";
  static final registration = "$_baseUrl/registration";
  static final login = "$_baseUrl/login";
  static final createTask = "$_baseUrl/createTask";
  static final getNewTasks = "$_baseUrl/listTaskByStatus/New";

  /*
    We can call task status for api integration from enum class ->
    static getNewTasks = "$_baseUrl/listTaskByStatus/${TaskStatus.New.name}";
   */

  static final getProgressTasks = "$_baseUrl/listTaskByStatus/Progress";
  static final getCompletedTasks = "$_baseUrl/listTaskByStatus/Completed";
  static final getCancelledTasks = "$_baseUrl/listTaskByStatus/Cancelled";
  static final taskCountSummaryList = "$_baseUrl/taskStatusCount";

  static updateTaskStatus(String taskId, String status) =>
      "$_baseUrl/updateTaskStatus/$taskId/$status";

  static deleteTask(String taskId) => "$_baseUrl/deleteTask/$taskId";
  static final profileUpdate = "$_baseUrl/profileUpdate";

  static recoverEmail(String email) => "$_baseUrl/RecoverVerifyEmail/$email";

  static verifyOTP(String email, String otp) =>
      "$_baseUrl/RecoverVerifyOTP/$email/$otp";

  static final resetPassword = "$_baseUrl/RecoverResetPass";
}
