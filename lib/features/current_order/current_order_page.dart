import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_thai_star_flutter/features/current_order/blocs/current_order_bloc.dart';
import 'package:my_thai_star_flutter/features/current_order/dish_slip.dart';
import 'package:my_thai_star_flutter/features/current_order/order_confirmation.dart';
import 'package:my_thai_star_flutter/features/current_order/resume_header.dart';
import 'package:my_thai_star_flutter/features/current_order/total_price_display.dart';
import 'package:my_thai_star_flutter/features/menu/models/dish.dart';
import 'package:my_thai_star_flutter/shared_widgets/app_drawer.dart';
import 'package:my_thai_star_flutter/shared_widgets/custom_app_bar.dart';

import 'package:my_thai_star_flutter/features/current_order/order_list_header.dart';

class CurrentOrderPage extends StatelessWidget {
  CurrentOrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ResumeHeader(),
                OrderListHeader(),
              ],
            ),
          ),
          BlocBuilder<CurrentOrderBloc, LinkedHashMap<Dish, int>>(
            builder: (context, dishes) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  Dish dish = dishes.keys.toList()[index];
                  int amount = dishes[dish];

                  return DishSlip(dish: dish, amount: amount);
                },
                childCount: dishes.length,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                TotalPriceDisplay(),
                OrderConfirmation(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}