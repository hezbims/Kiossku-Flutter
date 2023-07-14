import 'package:common/navigation/bottom_nav_bar_index.dart';
import 'package:common/presentation/controller/kiossku_bottom_nav_bar_controller.dart';
import 'package:dependencies/getx/getx.dart';
import 'package:flutter/material.dart';

class KiosskuBottomNavBar extends StatelessWidget{
  final controller = Get.find<KiosskuBottomNavBarController>();

  final int currentSelectedIndex;
  KiosskuBottomNavBar({
    super.key ,
    required this.currentSelectedIndex
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (selectedIndex){
          if (selectedIndex != currentSelectedIndex){
            if (selectedIndex == BottomNavBarIndex.homeIndex){
              controller.onClickHome();
            }
            else if (selectedIndex == BottomNavBarIndex.submitPropertiIndex){
              controller.onClickSewaJual();
            }
          }
        },
        currentIndex: currentSelectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Sewa/Jual",
          )
        ]
    );
  }
}