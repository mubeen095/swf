import 'package:coffee_shop/core/config/colors.dart';
import 'package:coffee_shop/core/constants/assets_manager.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Drawer(
      width: size.width * 0.8,
      child: const Column(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: AppColors.primary,
                // borderRadius: BorderRadius.vertical(
                //   bottom: Radius.circular(10.0),
                // ),
              ),
              child: SizedBox(
                  width: double.maxFinite, child: Center(child: Text("Logo")))),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard"),
            trailing: Icon(Icons.arrow_forward_ios, size: 20.0,),
          ),
           ListTile(
            leading: Icon(Icons.person_add),
            title: Text("Interview Invitation"),
            trailing: Icon(Icons.arrow_forward_ios, size: 20.0,),
          ),
           ListTile(
            leading: Icon(Icons.insights),
            title: Text("My Process Update"),
            trailing: Icon(Icons.arrow_forward_ios, size: 20.0,),
          ),
           ListTile(
            leading: Icon(Icons.person),
            title: Text("Personal Details"),
            trailing: Icon(Icons.arrow_forward_ios, size: 20.0,),
          ),
          
        ],
      ),
    );
  }
}
