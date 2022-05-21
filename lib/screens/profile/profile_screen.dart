import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/screens/profile/components/personal_information.dart';
import 'package:stylish/screens/settings/setting_screen.dart';
import 'package:stylish/services/shared_service.dart';

import 'components/profile_options.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const BackButton(color: Colors.black),
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.login,
              color: Colors.grey,
            ),
            onPressed: () {
              SharedService.logout(context);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const SettingScreen(),
                  ));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 100.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/abdullah.png'),
                  ),
                  const SizedBox(height: defaultPadding),
                  Text(
                    "Abdullah Ishtiaq",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  Text(
                    "abdullah@gmail.com",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding * 2),
            const ProfileOptions(),
            const SizedBox(height: defaultPadding),
            Text(
              "Personal Information",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: defaultPadding),
            const PersonalInfo(),
          ],
        ),
      ),
    );
  }
}
