import 'package:equatable/equatable.dart';

import '../../../../domain/entities/order_model.dart';

class OrderState extends Equatable {
  final String selectedStatus;
  final DateTime? selectedDate;
  final List<OrderModel> filteredOrders;

  const OrderState({
    this.selectedStatus = 'All',
    this.selectedDate,
    this.filteredOrders = const [], // Default to empty list
  });

  OrderState copyWith({
    String? selectedStatus,
    DateTime? selectedDate,
    List<OrderModel>? filteredOrders,
  }) {
    return OrderState(
      selectedStatus: selectedStatus ?? this.selectedStatus,
      selectedDate: selectedDate ?? this.selectedDate,
      filteredOrders: filteredOrders ?? this.filteredOrders,
    );
  }

  @override
  List<Object?> get props => [selectedStatus, selectedDate, filteredOrders];
}
