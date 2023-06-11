import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme-context.dart';

class ChooseThemeWidget extends StatelessWidget {
  const ChooseThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: ExpansionTile(
        title: Text("chooseTheme".tr),
        children: [
          Wrap(
            children: [
              TextButton(onPressed: (){
                context.read<ThemeChange>().changeTheme = darkTheme;
                context.read<ThemeChange>().saveTheme("darkTheme");
                context.read<ThemeChange>().getThemeFromSave();
              }, child: Text("darkTheme".tr,style: TextStyle(color: Theme.of(context).colorScheme.primary),)),
              TextButton(onPressed: (){
                context.read<ThemeChange>().changeTheme = lightTheme;
                context.read<ThemeChange>().saveTheme("lightTheme");
                context.read<ThemeChange>().getThemeFromSave();

              }, child: Text("lightTheme".tr,style: TextStyle(color: Theme.of(context).colorScheme.primary),)),
              TextButton(onPressed: (){
                context.read<ThemeChange>().changeTheme = theme3;
                context.read<ThemeChange>().saveTheme("coldTheme");
                context.read<ThemeChange>().getThemeFromSave();

              },child: Text("theme3".tr,style: TextStyle(color: Theme.of(context).colorScheme.primary),)),
              TextButton(onPressed: (){
                context.read<ThemeChange>().changeTheme = theme4;
                context.read<ThemeChange>().saveTheme("orangeTheme");
                context.read<ThemeChange>().getThemeFromSave();
              }, child: Text("theme4".tr,style: TextStyle(color: Theme.of(context).colorScheme.primary),)),
              TextButton(onPressed: (){
                context.read<ThemeChange>().changeTheme = theme5;
                context.read<ThemeChange>().saveTheme("greenTheme");
                context.read<ThemeChange>().getThemeFromSave();
              }, child: Text("theme5".tr,style: TextStyle(color: Theme.of(context).colorScheme.primary),)),
              
            ],
          ),
        ],
      ),
    );
  }
}
