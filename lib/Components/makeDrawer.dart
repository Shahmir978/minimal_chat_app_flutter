import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:minimal_chat_app_flutter/Services/Auth/auth_service.dart';
import 'package:minimal_chat_app_flutter/Pages/Settings_Page.dart';

class makeDrawer extends StatelessWidget {
  const makeDrawer({super.key});
void logout ()async{
  // get auth service
  final _auth = AuthService();
  _auth.signOut();
}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Iconsax.messages_1,
                    size: 74,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),

              // home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text("H O M E"),
                  onTap: () {
                    //pop the drawer
                    Navigator.pop(context);
                  },
                ),
              ),

              // settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(Iconsax.setting_2),
                  title: Text("S E T T I N G S"),
                  onTap: () {
                    //pop the drawer
                    Navigator.pop(context);
                    //navigate to settingspage
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsPage()));
                  },
                ),
              ),
            ],
          ),

          // logout list tile
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("L O G O U T"),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
