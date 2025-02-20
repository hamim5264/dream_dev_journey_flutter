import 'package:flutter/material.dart';

class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
      tileColor: Colors.green,
    );
  }
}
