import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/ui/screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({
    super.key,
    this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (enableOnTap) {
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
        "Abdul Hamim",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        "hamim@gmail.com",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: enableOnTap
          ? const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            )
          : null,
      tileColor: Colors.green,
    );
  }
}
