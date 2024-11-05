import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/orders_list_view.dart';
import '../../../core/common/widgets/search_and_status_bar.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SizedBox(
        height: 0.9.sh,
        child: const Column(
          children: [
            SearchAndStatusWidget(),
            SizedBox(
              height: 50,
              child: TabBar(
                indicatorColor: Colors.transparent,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                tabs: [
                  Tab(text: "New Orders (3)"),
                  Tab(text: "Accepted (1)"),
                  Tab(text: "Ongoing Orders (1)"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  OrdersListView(status: "New"),
                  OrdersListView(status: "Accepted"),
                  OrdersListView(status: "Ongoing"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
