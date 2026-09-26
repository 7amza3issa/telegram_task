import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInfoSection extends StatelessWidget {
  final String phone;
  final String username;
  final String bio;
  final String birthday;

  const ProfileInfoSection({
    super.key,
    required this.phone,
    required this.username,
    required this.bio,
    required this.birthday,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.cardColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoTitle(
            context: context,
            title: phone,
            subtitle: 'Mobile'.tr,
            onTap: () {},
          ),
          Divider(height: 1, color: theme.dividerColor),
          _buildInfoTitle(
            context: context,
            title: username,
            subtitle: 'Username'.tr,
            onTap: () {},
          ),
          Divider(height: 1, color: theme.dividerColor),
          _buildInfoTitle(context: context, title: bio, subtitle: 'Bio'.tr),
          Divider(height: 1, color: theme.dividerColor),
          _buildInfoTitle(
            context: context,
            title: birthday,
            subtitle: 'Date of Birth'.tr,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTitle({
    required BuildContext context,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
