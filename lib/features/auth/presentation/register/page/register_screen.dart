import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rivo_app/core/config/toast.dart';
import 'package:rivo_app/core/constant/routes.dart';
import 'package:rivo_app/core/functions/validat.dart';
import 'package:rivo_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:rivo_app/features/auth/presentation/bloc/register/register_bloc.dart';

import '../../../../../core/constant/info_widget.dart';
import '../../../../../core/widgets/background_auth.dart';
import '../../../../../core/widgets/logo_auth.dart';
import '../../../../../core/widgets/text_form_faild.dart';
import '../../login/widgets/botton.dart';
import '../../login/widgets/text_rigester_account.dart';
import '../widgets/drop_down_city.dart';
import '../widgets/drop_down_gender.dart';
import '../widgets/faild_date_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final RegisterBloc registerBloc;
  late int gender;
  late int city;
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  late final TextEditingController fullNameController;
  late final TextEditingController phoneNumberController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    registerBloc = RegisterBloc();
    gender = 1;
    city = 1;
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => registerBloc,
      child: Scaffold(
        body: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state.registerStatus == RegisterStatus.loading) {
              return Toast.showLoading();
            } else if (state.registerStatus == RegisterStatus.failed) {
              Toast.closeAllLoading();
              Toast.showText(text: "Some thing wrong");
            } else if (state.registerStatus == RegisterStatus.success) {
              Toast.closeAllLoading();
              context.pushNamed(AppRouter.splashScreen);
            }
          },
          builder: (context, state) {
            return Center(
              child: InfoWidget(builder: (context, deviceType) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    const BackGroundAuthScreen(),
                    const CustomLogoAuth(authTypeName: "إنشاء حساب"),
                    Form(
                      key: _formKey,
                      child: Container(
                        height: deviceType.localHeight!,
                        margin: EdgeInsets.only(
                            left: deviceType.localWidth! / 8,
                            right: deviceType.localWidth! / 8,
                            top: deviceType.localHeight! / 4,
                            bottom: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: deviceType.localWidth! / 17,
                              ),
                              CustomTextFormFaild(
                                  hintText: "الاسم الكامل",
                                  textEditingController: fullNameController,
                                  validator: (val) {
                                    validator(val!, 3, 20, "Full Name");
                                    return null;
                                  }),
                              CustomDatePickerFaild(
                                onTap: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime(2024))
                                      .then((value) {
                                    registerBloc.add(GetDateEvent(
                                        dateTime: value.toString()));
                                  });
                                },
                                hintText: state.dateTime == ""
                                    ? "تاريخ الميلاد"
                                    : state.dateTime,
                                textEditingController: TextEditingController(),
                                validator: (val) {
                                  return null;
                                },
                              ),
                              CustomDropDownGender(
                                  gender: gender,
                                  onChanged: (val) {
                                    gender = val!;
                                  }),
                              CustomDropDownCities(
                                city: city,
                                onChanged: (val) {},
                              ),
                              CustomTextFormFaild(
                                  hintText: "اسم المستخدم",
                                  textEditingController: userNameController,
                                  validator: (val) {
                                    return validator(val!, 3, 20, "User Name");
                                  }),
                              CustomTextFormFaild(
                                  obscureText: true,
                                  hintText: "كلمة المرور",
                                  textEditingController: passwordController,
                                  validator: (val) {
                                    return validator(val!, 3, 30, "password");
                                  }),
                              CustomTextFormFaild(
                                  hintText: "رقم الهاتف",
                                  textEditingController: phoneNumberController,
                                  validator: (val) {
                                    validator(val!, 3, 20, "Full Name");
                                    return null;
                                  }),
                              SizedBox(
                                height: deviceType.localHeight! / 16,
                              ),
                              CustomBottonAuth(
                                  title: "إنشاء حساب",
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      registerBloc.add(GetRegisterEvent(
                                          registerParams: RegisterParams(
                                              userName: userNameController.text,
                                              password: passwordController.text,
                                              passwordConfirmation:
                                                  passwordController.text,
                                              fullName: fullNameController.text,
                                              dateOfBirth: dateTime.toString(),
                                              gender: gender.toString(),
                                              cityId: city.toString(),
                                              phone:
                                                  phoneNumberController.text)));
                                    }
                                  },
                                  deviceInfo: deviceType),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: CustomTextQuestionAuth(
                                  textAuthType: "تسجيل الدخول",
                                  textQuestion: "لديك حساب بالفعل؟",
                                  onPressed: () {
                                    context.pop();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
