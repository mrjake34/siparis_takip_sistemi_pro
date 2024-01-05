import 'package:flutter/material.dart';
import '../widgets/navbar_buttons.dart';

final class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Image.asset(
                      'assets/images/main-logo-350.png',
                    ),
                  ),
                ),
              ],
            ),
            const NavbarButtons(),
          ],
        ),
      ),
    );
  }
}
