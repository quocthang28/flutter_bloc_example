import 'dart:ffi';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/model/restaurant_menu/restaurant_menu.dart';
import 'package:flutter_bloc_example/model/restaurant_model/comment.dart';
import 'package:flutter_bloc_example/model/restaurant_model/recommended.dart';
import 'package:flutter_bloc_example/model/restaurant_model/restaurant.dart';
import 'package:flutter_bloc_example/navigation/app_router.gr.dart';
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
  late final RecommendedRestaurant recommendedRestaurant;

  bool hasComment = false;

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController1 = TextEditingController();

  bool isLoadingMenu = true;
  bool isLoadingComments = true;
  bool isLoadingRecommendedRestaurants = true;

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

    _restaurantRepository.getRecommendedRestaurant(widget.res.sId!).then((value) {
      recommendedRestaurant = value;
      setState(() {
        isLoadingRecommendedRestaurants = false;
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
                    child: 'Đang mở của'.text.size(18).bold.color(AppColor.mainColor).make()),
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
              color: Colors.grey[300],
              height: 4,
              thickness: 4,
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
                '${Random().nextInt(10).toString()}km'.text.size(14).green900.make(),
                '(từ vị trí hiện tại)'.text.size(14).color(Colors.black54).make()
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
                widget.res.phone!.text.size(16).make(),
              ],
            ).px(5),
            Divider(
              color: Colors.grey[300],
              height: 4,
              thickness: 4,
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
              color: Colors.grey[300],
              height: 4,
              thickness: 4,
            ).py(10),
            Align(
                    alignment: Alignment.centerLeft,
                    child: 'Quán ăn tương tự'.text.color(AppColor.mainColor).semiBold.size(18).make())
                .px(10),
            isLoadingRecommendedRestaurants
                ? const SizedBox.shrink()
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: recommendedRestaurant.data!.map((e) => RRestaurantCard(res: e)).toList(),
                    ),
                  ).p(5),
            Divider(
              color: Colors.grey[300],
              height: 4,
              thickness: 4,
            ).pOnly(bottom: 10),
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
            hasComment
                ? Column(
                    children: <Widget>[
                      Row(
                        children: [
                          CircleAvatar(
                                  child: Image.network(
                                      'https://media-cdn.laodong.vn/Storage/NewsPortal/2021/3/26/892912/John-Wick-Phan-4.jpg'))
                              .cornerRadius(40),
                          8.widthBox,
                          'BOY PRO VIP'.text.make(),
                        ],
                      ).p(10),
                      Align(
                              alignment: Alignment.centerLeft,
                              child: _textEditingController1.text.text.semiBold.size(16).make())
                          .p(10),
                      Align(alignment: Alignment.centerLeft, child: _textEditingController.text.text.size(15).make())
                          .px(10),
                    ],
                  )
                : const SizedBox.shrink(),
            10.heightBox,
            Align(
                    alignment: Alignment.centerLeft,
                    child: 'Nhập đánh giá/bình luận'.text.color(AppColor.mainColor).semiBold.size(18).make())
                .px(10),
            10.heightBox,
            Column(
              children: [
                TextField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _textEditingController1,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    hintText: 'Tiêu đề',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.mainColor, width: 0.7),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.mainColor, width: 0.7),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.mainColor, width: 0.7),
                    ),
                  ),
                ).p(10),
                Row(
                  children: [
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: _textEditingController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        hintText: 'Bình luận',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.mainColor, width: 0.7),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.mainColor, width: 0.7),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.mainColor, width: 0.7),
                        ),
                      ),
                    ).pOnly(left: 10).expand(),
                    IconButton(
                      onPressed: () async {
                        // _textEditingController.clear();
                        // _textEditingController1.clear();
                        setState(() {
                          hasComment = true;
                        });
                      },
                      disabledColor: Colors.grey,
                      icon: const Icon(
                        Icons.send,
                        color: AppColor.mainColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            30.heightBox,
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

class RRestaurantCard extends StatelessWidget {
  const RRestaurantCard({Key? key, required this.res}) : super(key: key);

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
