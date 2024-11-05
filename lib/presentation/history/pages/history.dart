import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jisr/core/configs/theme/app_colors.dart';
import 'package:jisr/presentation/orders/widgets/order_card.dart';
import '../../../core/common/widgets/app_title_widget.dart';
import '../../../core/common/widgets/search_and_status_bar.dart';
import '../../../data/repository/order_repository_impl.dart';
import '../../../domain/usecases/get_orders_usecase.dart';
import '../bloc/order_status_cubit/order_status_cubit.dart';
import '../bloc/order_status_cubit/order_status_state.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OrderStatusCubit(GetOrdersUseCase(OrderRepositoryImpl())),
        child: Center(
          child: Container(
            width: 360,
            height: 700,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 8),
                  blurRadius: 16,
                ),
              ],
            ),
            child: Column(
              children: [
                const SearchAndStatusWidget(),
                const AppTitleWidget(),
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => print("Today Filter"),
                      child: const Text("Today", style: TextStyle(color: AppColors.primary)),
                    ),
                    GestureDetector(
                      onTap: () => _pickDate(context),
                      child: const Row(
                        children: [
                          Text("Custom Date", style: TextStyle(color: AppColors.primary)),
                          Icon(Icons.arrow_drop_down, color: Colors.grey),
                        ],
                      ),
                    ),
                    BlocBuilder<OrderStatusCubit, OrderState>(
                      builder: (context, state) {
                        return DropdownButton<String>(
                          style: const TextStyle(color: AppColors.primary),
                          value: state.selectedStatus,
                          items: const [
                            DropdownMenuItem(value: 'All', child: Text('All')),
                            DropdownMenuItem(value: 'Completed', child: Text('Completed')),
                            DropdownMenuItem(value: 'Rejected', child: Text('Rejected')),
                            DropdownMenuItem(value: 'Pending', child: Text('Pending')),
                          ],
                          onChanged: (newValue) {
                            context.read<OrderStatusCubit>().setSelectedStatus(newValue);
                          },
                          underline: const SizedBox(),
                          hint: const Text("Select Status"),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Filtered Order Cards
              Expanded(
                child: BlocBuilder<OrderStatusCubit, OrderState>(
                  builder: (context, state) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: state.filteredOrders.length,
                      itemBuilder: (context, index) {
                        return OrderCard(order: state.filteredOrders[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  void _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            dialogBackgroundColor: Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      // Uncomment and use this line if you want to set the date in your OrderStatusCubit.
      // context.read<OrderStatusCubit>().setSelectedDate(picked);
    }
  }

}

