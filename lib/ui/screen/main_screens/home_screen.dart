import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc_example/model/restaurant_model/recommended.dart';
import 'package:flutter_bloc_example/model/restaurant_model/restaurant.dart';
import 'package:flutter_bloc_example/model/restaurant_model/restaurant_v2.dart';
import 'package:flutter_bloc_example/navigation/route_name.dart';
import 'package:flutter_bloc_example/repository/restaurant_repository.dart';
import 'package:flutter_bloc_example/ui/screen/main_screens/restaurant_detail.dart';
import 'package:flutter_bloc_example/ui/screen/main_screens/search_screen.dart';
import 'package:flutter_bloc_example/ui/ui_constant/app_color.dart';
import 'package:get_it/get_it.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:auto_route/auto_route.dart';

import '../../../navigation/app_router.gr.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RestaurantRepository _restaurantRepository = GetIt.I<RestaurantRepository>();

  late final RestaurantV2 nearest;
  late final RestaurantV2 mostViews;
  late final Restaurant recommended;

  final TextEditingController textEditingController = TextEditingController();

  bool isLoading1 = true;
  bool isLoading2 = true;
  bool isLoading3 = true;

  @override
  void initState() {
    _restaurantRepository.getNearbyRestaurants().then((value) => nearest = value).then((value) => setState(() {
          isLoading1 = false;
        }));
    _restaurantRepository.getMostViewedRestaurants().then((value) => mostViews = value).then((value) => setState(() {
          isLoading2 = false;
        }));
    _restaurantRepository
        .getRestaurant(Random().nextInt(10).toString(), '10', Random().nextInt(10).toString())
        .then((value) => recommended = value)
        .then((value) => setState(() {
              isLoading3 = false;
            }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).viewPadding.top,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [AppColor.mainColor.withOpacity(0.8), AppColor.mainColor]),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [AppColor.mainColor.withOpacity(0.8), AppColor.mainColor]),
          ),
          child: TextField(
            onChanged: (value) {},
            onSubmitted: (value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen(searchTerm: textEditingController.text)));
            },
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.search, color: Colors.black54),
              hintText: 'Nhập tên món, quán ăn...',
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
              contentPadding: EdgeInsets.all(12),
              isDense: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black54,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black54,
                ),
              ),
            ),
          ).p(10),
        ),
        SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              10.heightBox,
              const Header(title: 'Địa điểm gần bạn'),
              isLoading1 ? const SizedBox.shrink() : RestaurantListV2(restaurants: nearest),
              const Header(title: 'Quán được xem nhiều'),
              isLoading2 ? const SizedBox.shrink() : RestaurantListV2(restaurants: mostViews),
              const Header(title: 'Gợi ý quán ngon'),
              isLoading3
                  ? const SizedBox.shrink()
                  : GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: (200 / 250),
                      physics: const NeverScrollableScrollPhysics(),
                      primary: false,
                      padding: const EdgeInsets.all(5),
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                      children: recommended.data!.map((e) => RestaurantCard(res: e)).toList())
            ],
          ),
        ).expand(),
      ],
    );
  }
}

class RestaurantList extends StatelessWidget {
  const RestaurantList({Key? key, required this.restaurants}) : super(key: key);

  final Restaurant restaurants;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: restaurants.data!.map((e) => RestaurantCard(res: e)).toList(),
      ),
    ).p(5);
  }
}

class RestaurantListV2 extends StatelessWidget {
  const RestaurantListV2({Key? key, required this.restaurants}) : super(key: key);

  final RestaurantV2 restaurants;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: restaurants.data!.map((e) => RestaurantCardV2(res: e)).toList(),
      ),
    ).p(5);
  }
}

class RestaurantCardV2 extends StatelessWidget {
  const RestaurantCardV2({Key? key, required this.res}) : super(key: key);

  final DataV2 res;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 235,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              res.photos!.first,
              width: 200,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          5.heightBox,
          res.name!.text.size(15).semiBold.ellipsis.make(),
          5.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.star_rate, color: Colors.yellow),
                  res.rating!.toString().text.make(),
                ],
              ),
              Row(
                children: <Widget>[
                  res.openTime!.isNotEmpty ? res.openTime!.first.text.make() : const SizedBox.shrink(),
                  res.openTime!.isNotEmpty ? ' - '.text.make() : const SizedBox.shrink(),
                  res.openTime!.isNotEmpty ? res.openTime!.last.text.make() : const SizedBox.shrink(),
                  5.widthBox,
                ],
              ),
            ],
          ),
          5.heightBox,
          res.addressDetail!.text.size(13).color(Colors.black54).overflow(TextOverflow.visible).make(),
        ],
      ).p(5),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({Key? key, required this.res}) : super(key: key);

  final Data res;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(RestaurantDetailRoute(res: res)),
      child: SizedBox(
        width: 200,
        height: 235,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                res.photos!.first,
                width: 200,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            5.heightBox,
            res.name!.text.size(15).semiBold.ellipsis.make(),
            5.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.star_rate, color: Colors.yellow),
                    res.rating!.toString().text.make(),
                  ],
                ),
                Row(
                  children: <Widget>[
                    res.openTime!.isNotEmpty ? res.openTime!.first.text.make() : const SizedBox.shrink(),
                    res.openTime!.isNotEmpty ? ' - '.text.make() : const SizedBox.shrink(),
                    res.openTime!.isNotEmpty ? res.openTime!.last.text.make() : const SizedBox.shrink(),
                    5.widthBox,
                  ],
                ),
              ],
            ),
            5.heightBox,
            res.addressDetail!.text.size(13).color(Colors.black54).overflow(TextOverflow.visible).make(),
          ],
        ).p(5),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: title.text.semiBold.size(20).color(AppColor.mainColor).make(),
      ),
    ).pOnly(top: 10).px(10);
  }
}
