import 'package:coffee_shop/core/config/colors.dart';
import 'package:coffee_shop/core/constants/size_manager.dart';
import 'package:coffee_shop/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BreakingNews extends StatelessWidget {
  const BreakingNews({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.3,
      // color: const Color.fromARGB(255, 223, 223, 223),
      padding: const EdgeInsets.symmetric(horizontal: SizeManager.pagePadding),
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              //  width: size.width*0.65,
              constraints: BoxConstraints(maxWidth: size.width * 0.55),
              padding: const EdgeInsets.only(right: SizeManager.pagePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // child: Image.network(
                    //   'https://images.unsplash.com/photo-1546422904-90eab23c3d7e?q=80&w=2944&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    //   height: size.height * 0.15,
                    //   width: size.height * 0.55,
                    //   fit: BoxFit.cover,
                    // ),
                    child: CustomCachedImage(
                      imageUrl:
                          "https://images.unsplash.com/photo-1546422904-90eab23c3d7e?q=80&w=2944&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      height: size.height * 0.15,
                      width: size.height * 0.55,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Gap(5.0),
                  Text(
                    "Kathmandu starts getting Melamchi water again",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                        height: 1.2),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(4.0),
                  Text(
                    "2 hours ago",
                    style: Theme.of(context).textTheme.labelSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
