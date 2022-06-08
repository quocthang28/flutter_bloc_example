import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/model/restaurant_model/restaurant.dart';
import 'package:flutter_bloc_example/repository/restaurant_repository.dart';
import 'package:flutter_bloc_example/ui/ui_constant/app_color.dart';
import 'package:get_it/get_it.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../navigation/app_router.gr.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final RestaurantRepository _restaurantRepository = GetIt.I<RestaurantRepository>();

  late final Restaurant saved;
  bool isLoading = true;

  @override
  void initState() {
    _restaurantRepository
        .getRestaurant(Random().nextInt(10).toString(), Random().nextInt(7).toString(), Random().nextInt(10).toString())
        .then((value) => saved = value)
        .then((value) => setState(() {
              isLoading = false;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).viewPadding.top,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [AppColor.mainColor.withOpacity(0.8), AppColor.mainColor]),
            ),
          ),
          Align(
                  alignment: Alignment.centerLeft,
                  child: 'Địa điểm đã lưu'.text.size(20).bold.color(AppColor.mainColor).make())
              .p(10),
          isLoading
              ? const SizedBox.shrink()
              : ListView(
                  padding: EdgeInsets.zero,
                  children: saved.data!
                      .map((e) => GestureDetector(
                            onTap: () => context.pushRoute(RestaurantDetailRoute(res: e)),
                            child: ListTile(
                              visualDensity: VisualDensity.comfortable,
                              leading: Image.network(e.photos!.first),
                              title: e.name!.text.make(),
                              subtitle: e.addressDetail!.text.make(),
                            ).py(10),
                          ))
                      .toList(),
                ).expand()
        ],
      ),
    );
  }
}
