import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/navigation/route_name.dart';
import 'package:flutter_bloc_example/ui/common_component/button.dart';
import 'package:flutter_bloc_example/ui/common_component/card.dart';
import 'package:flutter_bloc_example/ui/common_component/input_field.dart';
import 'package:flutter_bloc_example/ui/ui_constant/app_color.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('background.jpg'), fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppCard(
                  child: Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.center,
                          child: 'Đăng nhập'.text.color(AppColor.mainColor).size(24).make()),
                      30.heightBox,
                      InputField(
                        controller: _emailController,
                        iconData: Icons.email_outlined,
                        hintText: 'Email',
                        inputType: TextInputType.emailAddress,
                      ),
                      20.heightBox,
                      InputField(
                        controller: _pwController,
                        iconData: Icons.lock_outlined,
                        hintText: 'Mật khẩu',
                        inputType: TextInputType.visiblePassword,
                      ),
                      40.heightBox,
                      AuthButton(onTap: () {}, label: 'Đăng nhập'),
                      30.heightBox,
                      'hoặc đăng nhập bằng'.text.color(Colors.black54).make(),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            child: Image.network('http://pngimg.com/uploads/google/google_PNG19635.png',
                                fit: BoxFit.cover),
                            height: 50,
                            width: 50,
                          ),
                          30.widthBox,
                          SizedBox(
                            child: Image.network(
                                'https://swissmacuser.ch/wp-content/uploads/2015/09/Facebook-Logo-rounded.png',
                                fit: BoxFit.cover),
                            height: 35,
                            width: 35,
                          ),
                        ],
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          'Chưa có tài khoản?'.text.color(Colors.black54).make(),
                          10.widthBox,
                          AuthButton(
                              onTap: () => context.router.pushNamed(RouteName.registerScreen), label: 'Đăng kí'),
                        ],
                      )
                    ],
                  ).px(15).py(40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
