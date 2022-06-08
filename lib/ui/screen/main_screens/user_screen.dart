import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/ui/common_component/card.dart';
import 'package:flutter_bloc_example/ui/ui_constant/app_color.dart';
import 'package:velocity_x/velocity_x.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

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
          10.heightBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: const CircleAvatar(
                  radius: 38,
                  foregroundImage: NetworkImage(
                      "https://media-cdn.laodong.vn/Storage/NewsPortal/2021/3/26/892912/John-Wick-Phan-4.jpg"),
                ),
                title: 'Thang'.text.bold.size(18).color(Colors.black54).make(),
                subtitle: 'cqt282@gmail.com'.text.size(14).color(Colors.black54).make(),
                trailing: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          ),
          AppCard(
            child: Column(
              children: <Widget>[
                10.heightBox,
                _UserMenuItem(
                  onTap: () {},
                  title: 'Địa chỉ giao hàng',
                  iconData: Icons.location_on_outlined,
                ),
                10.heightBox,
                _UserMenuItem(
                  onTap: () {},
                  title: 'Phương thức thanh toán',
                  iconData: Icons.payment_outlined,
                ),
                10.heightBox,
                _UserMenuItem(
                  onTap: () {},
                  title: 'Lịch sử đặt hàng',
                  iconData: Icons.format_list_bulleted_outlined,
                ),
                10.heightBox,
                _UserMenuItem(
                  onTap: () {},
                  title: 'Yêu thích',
                  iconData: Icons.favorite_border_outlined,
                ),
                10.heightBox,
                _UserMenuItem(
                  onTap: () {},
                  title: 'Ngôn ngữ',
                  iconData: Icons.language_outlined,
                  trailing: 'Tiếng Việt'.text.size(14).color(Colors.grey).make(),
                ),
                10.heightBox,
              ],
            ),
          ),
          20.heightBox,
          AppCard(
            child: Column(
              children: <Widget>[
                10.heightBox,
                _UserMenuItem(
                  onTap: () {},
                  title: 'Cài đặt thông báo',
                  iconData: Icons.notifications_none_outlined,
                ),
                10.heightBox,
                _UserMenuItem(
                  onTap: () {},
                  title: 'Điều khoản riêng tư',
                  iconData: Icons.policy_outlined,
                ),
                10.heightBox,
                _UserMenuItem(
                  onTap: () {},
                  title: 'Câu hỏi thường gặp',
                  iconData: Icons.question_mark,
                ),
                10.heightBox,
                _UserMenuItem(
                  onTap: () {},
                  title: 'Đánh giá ứng dụng',
                  iconData: Icons.star_rate_outlined,
                ),
                10.heightBox,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UserMenuItem extends StatelessWidget {
  const _UserMenuItem({Key? key, required this.onTap, required this.title, required this.iconData, this.trailing})
      : super(key: key);

  final VoidCallback onTap;
  final String title;
  final IconData iconData;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: <Widget>[
              Icon(
                iconData,
                color: AppColor.mainColor,
                size: 24,
              ),
              15.widthBox,
              title.text.size(16).make(),
            ],
          ).px(10),
          (trailing ?? 0.widthBox).pOnly(right: 15),
        ],
      ),
    ).py(3);
  }
}
