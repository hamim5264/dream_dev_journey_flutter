import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/ui/controllers/auth_controller.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/ui/screens/edit_profile_screen.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileSummaryCard extends StatefulWidget {
  const ProfileSummaryCard({
    super.key,
    this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  State<ProfileSummaryCard> createState() => _ProfileSummaryCardState();
}

class _ProfileSummaryCardState extends State<ProfileSummaryCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (widget.enableOnTap) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProfileScreen(),
            ),
          );
        }
      },
      leading: CircleAvatar(
        backgroundColor: Colors.black54,
        child: Icon(
          Icons.adb,
          color: Colors.white,
        ),
      ),
      title: Text(
        getFullName,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        AuthController.user?.email ?? "",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: IconButton(
        onPressed: () async {
          await AuthController.clearAuthData();
          if (mounted) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          }
        },
        icon: Icon(
          Icons.logout_rounded,
          color: Colors.white,
        ),
      ),
      tileColor: Colors.green,
    );
  }

  String get getFullName {
    return "${AuthController.user?.firstName ?? ""} ${AuthController.user?.lastName ?? ""}";
  }
}
