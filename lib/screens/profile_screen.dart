import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontSize: 20, color: Colors.white,),),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button click
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Information
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      // Profile Picture
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/Alpesh_garg.png'), 
                      ),
                      const SizedBox(width: 16),
                      // Profile Details
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profileProvider.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.phone, color: Colors.redAccent),
                              const SizedBox(width: 8),
                              Text(profileProvider.phone),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.email, color: Colors.redAccent),
                              const SizedBox(width: 8),
                              Text(profileProvider.email),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Menu Options
            MenuOption(icon: Icons.person, text: 'Edit Profile', onTap: () {}),
            MenuOption(icon: Icons.file_copy, text: 'Documents', onTap: () {}),
            MenuOption(icon: Icons.headset_mic, text: 'Support', onTap: () {}),
            MenuOption(icon: Icons.help, text: 'FAQ', onTap: () {}),
            MenuOption(icon: Icons.policy, text: 'Terms & Conditions', onTap: () {}),
            MenuOption(icon: Icons.privacy_tip, text: 'Privacy', onTap: () {}),
            MenuOption(icon: Icons.logout, text: 'Log Out', onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class MenuOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const MenuOption({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(text),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
