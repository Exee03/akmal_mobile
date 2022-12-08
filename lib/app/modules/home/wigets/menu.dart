import 'package:akmal_mobile/app/configs/constant.dart';
import 'package:akmal_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuWidget extends GetView<HomeController> {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = (Theme.of(context).textTheme.headline1?.fontSize ?? 80);
    final screenWidth = MediaQuery.of(context).size.width;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final iconSize = Theme.of(context).textTheme.headline3?.fontSize;

    return Obx(
      () => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ((screenWidth - 100) / size).floor(),
        ),
        itemCount: controller.menus.length,
        itemBuilder: (BuildContext context, int index) {
          final menu = controller.menus[index];

          return Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox.square(
              dimension: size,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                color: primaryColor.withOpacity(0.7),
                child: InkWell(
                  onTap: menu.onPressed,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: (iconSize ?? 0) + 20,
                        width: (iconSize ?? 0) + 20,
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          menu.icon,
                          color: primaryColor,
                          size: iconSize,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        menu.title,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
