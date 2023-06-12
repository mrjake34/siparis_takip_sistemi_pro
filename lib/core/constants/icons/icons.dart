import 'package:flutter/material.dart';

class AppIcons {
AppIcons._init();
static final AppIcons _instance = AppIcons._init();
static AppIcons get instance => _instance;


  final IconData orderListIcon = Icons.list_alt;
  final IconData isDoneIcon = Icons.task_alt;
  final IconData onTheWayIcon = Icons.delivery_dining_outlined;
  final IconData inProcessIcon = Icons.access_time;
  final IconData pendingIcon = Icons.pending_outlined;
  final IconData produtIcon = Icons.view_in_ar;
  final IconData moreIcon = Icons.miscellaneous_services_outlined;
}