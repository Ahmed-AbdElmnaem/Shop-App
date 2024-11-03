import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1F4E79),
        body: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/147/147142.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Ahmed Mohamed',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/203/203024.png',
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover,
                ),
                const Text('02+',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  '0123456789',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ListView(
              shrinkWrap: true,
              children: [
                const ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: Text(
                    'الملف الشخصي',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                ListTile(
                  enabled: true,
                  onTap: () {},
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'الاعدادات',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  title: Text(
                    ' العناوين',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  title: Text(
                    'المفضلة',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    'تسجيل الخروج',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
