import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/model/restaurant_model/restaurant.dart';
import 'package:flutter_bloc_example/navigation/app_router.gr.dart';
import 'package:flutter_bloc_example/repository/restaurant_repository.dart';
import 'package:flutter_bloc_example/ui/screen/main_screens/home_screen.dart';
import 'package:flutter_bloc_example/ui/ui_constant/app_color.dart';
import 'package:get_it/get_it.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.searchTerm}) : super(key: key);

  final String searchTerm;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final RestaurantRepository _restaurantRepository = GetIt.I<RestaurantRepository>();

  late final Restaurant res;

  bool isLoading = true;

  @override
  void initState() {
    _restaurantRepository.getRestaurantBySearchTerm(
        {"searchString": widget.searchTerm, "pageIndex": 1, "pageSize": 5, "currentPage": 0}).then((value) {
      res = value;
      Future.delayed(const Duration(seconds: 2)).then((value) {
        setState(() {
          isLoading = false;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).viewPadding.top,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [AppColor.mainColor.withOpacity(0.8), AppColor.mainColor]),
            ),
          ),
          Header(title: 'Kết quả tìm kiếm từ khóa: ${widget.searchTerm}'),
          10.heightBox,
          isLoading
              ? const CircularProgressIndicator(color: AppColor.mainColor)
              : ListView(
                  padding: EdgeInsets.zero,
                  children: res.data!
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
