import 'package:flutter/material.dart';
import '../widgets/navbar_buttons.dart';

final class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      width: screenWidth * 0.6 < 600 ? screenWidth * 0.4 : screenWidth = 400,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            NavbarButtons(),
          ],
        ),
      ),
    );
  }
}
