import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rivo_app/core/config/toast.dart';
import 'package:rivo_app/core/functions/validat.dart';
import 'package:rivo_app/core/widgets/logo_auth.dart';
import 'package:rivo_app/core/widgets/text_form_faild.dart';
import 'package:rivo_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:rivo_app/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:rivo_app/features/auth/presentation/login/widgets/botton.dart';
import 'package:rivo_app/features/auth/presentation/login/widgets/text_rigester_account.dart';

import '../../../../../core/constant/info_widget.dart';
import '../../../../../core/constant/routes.dart';
import '../../../../../core/widgets/background_auth.dart';
import '../widgets/text_reset_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final LoginBloc loginBloc;
  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    loginBloc = LoginBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginBloc,
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.loginStatus == LoginStatus.loading) {
                  Toast.showLoading();
                } else if (state.loginStatus == LoginStatus.failed) {
                  Toast.closeAllLoading();
                  Toast.showText(text: "Some thing wrong");
                  //context.pushNamed(AppRouter.home);
                } else if (state.loginStatus == LoginStatus.success) {
                  Toast.closeAllLoading();
                  context.pushNamed(AppRouter.home);
                }
              },
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: InfoWidget(builder: (context, deviceType) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        const BackGroundAuthScreen(),
                        const CustomLogoAuth(authTypeName: "تسجيل الدخول"),
                        InfoWidget(builder: (context, devicetype) {
                          return SizedBox(
                            height: deviceType.localHeight,
                            width: deviceType.localWidth! / 1.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomBottonAuth(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      print("validate");
                                      loginBloc.add(GetLoginEvent(
                                          loginParams: LoginParams(
                                              userName: userNameController.text,
                                              password:
                                                  passwordController.text)));
                                    } else {
                                      print("no validate");
                                    }
                                  },
                                  deviceInfo: deviceType,
                                  title: 'تسجيل الدخول',
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  child: CustomTextQuestionAuth(
                                    onPressed: () {
                                      context.pushNamed(AppRouter.register);
                                    },
                                    textQuestion: 'ليس لديك حساب؟',
                                    textAuthType: "أنشئ حساب",
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: deviceType.localWidth! / 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextFormFaild(
                                  hintText: "اسم المستخدم",
                                  textEditingController: userNameController,
                                  validator: (val) {
                                    return validator(val!, 3, 20, "Name");
                                  }),
                              CustomTextFormFaild(
                                  obscureText: true,
                                  hintText: "كلمة المرور",
                                  textEditingController: passwordController,
                                  validator: (val) {
                                    return validator(val!, 5, 20, "Password");
                                  }),
                              CustomTextResetPassword(onPressed: () {}),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                );
              },
            ),
          )),
    );
  }
}
