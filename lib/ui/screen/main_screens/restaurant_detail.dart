import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/model/restaurant_menu/restaurant_menu.dart';
import 'package:flutter_bloc_example/model/restaurant_model/comment.dart';
import 'package:flutter_bloc_example/model/restaurant_model/restaurant.dart';
import 'package:flutter_bloc_example/repository/restaurant_repository.dart';
import 'package:flutter_bloc_example/ui/common_component/button.dart';
import 'package:flutter_bloc_example/ui/ui_constant/app_color.dart';
import 'package:get_it/get_it.dart';
import 'package:velocity_x/velocity_x.dart';

class RestaurantDetailPage extends StatefulWidget {
  const RestaurantDetailPage({Key? key, required this.res}) : super(key: key);

  final Data res;

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  final RestaurantRepository _restaurantRepository = GetIt.I<RestaurantRepository>();

  late final Menu menu;
  late final ResComment comments;
  bool isLoadingMenu = true;
  bool isLoadingComments = true;

  @override
  void initState() {
    _restaurantRepository.getMenu(widget.res.sId!).then((value) {
      menu = value;
      setState(() {
        isLoadingMenu = false;
      });
    });

    _restaurantRepository.getResComment(widget.res.sId!).then((value) {
      comments = value;
      setState(() {
        isLoadingComments = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).viewPadding.top,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppColor.mainColor.withOpacity(0.8), AppColor.mainColor]),
              ),
            ),
            Image.network(
              widget.res.photos![Random().nextInt(widget.res.photos!.length)],
              width: MediaQuery.of(context).size.width,
              height: 240,
              fit: BoxFit.fitWidth,
            ),
            15.heightBox,
            Align(
                    alignment: Alignment.centerLeft,
                    child: widget.res.name!.text.color(Colors.black54).semiBold.size(24).make())
                .px(15),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Random().nextInt(20).toString().text.size(20).semiBold.make(),
                    'Bình luận'.text.color(Colors.black54).size(14).make()
                  ],
                ),
                Column(
                  children: <Widget>[
                    Random().nextInt(20).toString().text.size(20).semiBold.make(),
                    'Hình ảnh'.text.color(Colors.black54).size(14).make()
                  ],
                ),
                Column(
                  children: <Widget>[
                    Random().nextInt(20).toString().text.size(20).semiBold.make(),
                    'Check-in'.text.color(Colors.black54).size(14).make()
                  ],
                ),
                Column(
                  children: <Widget>[
                    Random().nextInt(20).toString().text.size(20).semiBold.make(),
                    'Lưu lại'.text.color(Colors.black54).size(14).make()
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: widget.res.rating.toString().text.white.bold.size(18).make(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: 'Đang mở của'.text.size(20).bold.color(AppColor.mainColor).make()),
                AuthButton(onTap: () {}, label: 'Save').pOnly(right: 10)
              ],
            ).px(15).pOnly(top: 15),
            5.heightBox,
            Row(
              children: <Widget>[
                widget.res.openTime!.isNotEmpty
                    ? widget.res.openTime!.first.text.size(16).make()
                    : const SizedBox.shrink(),
                widget.res.openTime!.isNotEmpty ? ' - '.text.make() : const SizedBox.shrink(),
                widget.res.openTime!.isNotEmpty
                    ? widget.res.openTime!.last.text.size(16).make()
                    : const SizedBox.shrink(),
                5.widthBox,
              ],
            ).px(15),
            Divider(
              color: Colors.grey[400],
              height: 8,
              thickness: 8,
            ).py(10),
            Row(
              children: <Widget>[
                const Icon(
                  Icons.location_on_outlined,
                  color: AppColor.mainColor,
                  size: 30,
                ),
                5.widthBox,
                widget.res.addressDetail!.text.maxLines(2).ellipsis.size(15).make(),
              ],
            ).px(5),
            Row(
              children: <Widget>[
                '${Random().nextInt(10).toString()}km'.text.size(18).green900.make(),
                '(từ vị trí hiện tại)'.text.size(18).color(Colors.black54).make()
              ],
            ).px(40),
            10.heightBox,
            Row(
              children: <Widget>[
                const Icon(
                  Icons.phone,
                  color: AppColor.mainColor,
                  size: 30,
                ),
                5.widthBox,
                widget.res.phone!.text.size(18).make(),
              ],
            ).px(5),
            Divider(
              color: Colors.grey[400],
              height: 8,
              thickness: 8,
            ).py(10),
            Align(
                    alignment: Alignment.centerLeft,
                    child: 'Menu'.text.color(AppColor.mainColor).semiBold.size(18).make())
                .px(10),
            isLoadingMenu
                ? const SizedBox.shrink()
                : Column(
                    children: menu.data!
                        .map((e) => ListTile(
                              leading:
                                  Image.network(e.restaurantId!.photos![Random().nextInt(widget.res.photos!.length)]),
                              title: e.name!.text.make(),
                              subtitle: e.restaurantId!.priceRange!.first.text.make(),
                            ))
                        .toList(),
                  ),
            Divider(
              color: Colors.grey[400],
              height: 8,
              thickness: 8,
            ).py(10),
            Align(
                    alignment: Alignment.centerLeft,
                    child: 'Đánh giá'.text.color(AppColor.mainColor).semiBold.size(18).make())
                .px(10),
            isLoadingComments
                ? const SizedBox.shrink()
                : SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: comments.data!
                          .map((e) => Column(
                                children: [
                                  CommentTile(commentData: e),
                                  5.heightBox,
                                  const Divider(
                                    color: Colors.grey,
                                    height: 1,
                                    thickness: 1,
                                  ),
                                ],
                              ))
                          .toList(),
                    ),
                  ),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}

class CommentTile extends StatelessWidget {
  const CommentTile({Key? key, required this.commentData}) : super(key: key);

  final CommentData commentData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            CircleAvatar(child: Image.network(commentData.avatarUrl!)).cornerRadius(40),
            8.widthBox,
            commentData.displayName!.text.make(),
          ],
        ).p(10),
        Align(alignment: Alignment.centerLeft, child: commentData.title!.text.semiBold.size(16).make()).p(10),
        Align(alignment: Alignment.centerLeft, child: commentData.content!.text.size(15).make()).px(10),
      ],
    );
  }
}
