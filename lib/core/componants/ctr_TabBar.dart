import 'package:flutter/material.dart';

class ctr_TabBar extends StatelessWidget {
  final List<Widget>? LstTabBarViewHeaderWidget;
  final List<Widget>? LstTabBarViewWidget;
  final int initialIndex = 0;
  final Function(int)? onTap;

  ctr_TabBar({
    this.LstTabBarViewHeaderWidget,
    this.LstTabBarViewWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialIndex,
      length: LstTabBarViewHeaderWidget!.length,
      child: Column(
        children: [
          TabBar(
            // onTap: onTap,
            isScrollable: true,
            dividerColor: Colors.grey,
            tabAlignment: TabAlignment.start,
            tabs: buildTabBarNames(),
          ),
          Expanded(
            child: TabBarView(
              children: LstTabBarViewWidget!,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildTabBarNames() {
    List<Widget> tabBars = [];

    for (int i = 0; i < LstTabBarViewHeaderWidget!.length; i++) {
      tabBars.add(
        Tab(
          // text: LstTabBarViewNames![i],
          // child: Text( LstTabBarViewHeaderNames![i] ,style: Get.find<>().(fontWeight: FontWeight.bold , fontSize: valuesManager.numberDouble.n14),),
          child: LstTabBarViewHeaderWidget![i],
        ),
      );
    }
    return tabBars;
  }
}
