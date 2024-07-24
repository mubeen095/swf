import 'package:coffee_shop/core/config/colors.dart';
import 'package:coffee_shop/core/config/config.dart';
import 'package:coffee_shop/core/constants/constants.dart';
import 'package:coffee_shop/core/widgets/home_drawer.dart';
import 'package:coffee_shop/src/breaking_news.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 0.7).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Image.asset(
          AssetManager.logo,
          height: 50.0,
          width: 50.0,
          fit: BoxFit.fitWidth,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              radius: 22.0,
              backgroundColor: AppColors.secondary,
              child: CircleAvatar(
                radius: 19.0,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1639747280929-e84ef392c69a?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGUlMjBwaG90b3xlbnwwfHwwfHx8MA%3D%3D"),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(SizeManager.pagePadding),
            const Row(
              children: [
                Gap(SizeManager.pagePadding),
                HomeCard(
                  color: Color.fromARGB(255, 248, 104, 94),
                  iconData: Icons.sort,
                  label: "Selected By Company",
                  stats: "24",
                ),
                Gap(SizeManager.pagePadding),
                HomeCard(
                  color: Color.fromARGB(255, 213, 112, 231),
                  iconData: Icons.person_add,
                  label: "Interview Invites",
                  stats: "12",
                ),
                Gap(SizeManager.pagePadding),
              ],
            ),
            const Gap(SizeManager.pagePadding),
            Row(
              children: [
                const Gap(SizeManager.pagePadding),
                HomeCard(
                  color: Colors.green.shade300,
                  iconData: Icons.event_note,
                  label: "Interview Attendance",
                  stats: "10",
                ),
                const Gap(SizeManager.pagePadding),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      context.push(AppRoutes.uploadDocRoute);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color.fromARGB(255, 244, 244, 244),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withAlpha(35),
                                offset: const Offset(3, 3),
                                blurRadius: 10.0,
                                spreadRadius: 2.0)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Progress",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Gap(10.0),
                          AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                return LinearProgressIndicator(
                                  value: _animation.value,
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(SizeManager.pagePadding),
              ],
            ),
            const Gap(8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:SizeManager.pagePadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News/Updates",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: const Text("View all"))
                ],
              ),
            ),

            const BreakingNews(),
          ],
        ),
      ),
      // body: Center(
      //   child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //         onPressed: () {
      //           context.go('/a/details');
      //         },
      //         child: Text("Home detail"),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {super.key,
      required this.color,
      required this.iconData,
      required this.label,
      required this.stats});
  final String label;
  final String stats;
  final Color color;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: color.withAlpha(30),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: color.withAlpha(35),
                  offset: const Offset(3, 3),
                  blurRadius: 10.0,
                  spreadRadius: 2.0)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                child: Icon(
                  iconData,
                  color: AppColors.white,
                  size: 20.0,
                )),
            const Gap(10.0),
            Text(
              stats,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
