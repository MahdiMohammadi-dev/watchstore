import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/data/repository/user_info_repository.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/gen/fonts.gen.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';
import 'package:watchstore/screens/profile/bloc/profile_bloc.dart';
import 'package:watchstore/widgets/custom_app_bar.dart';
import 'package:watchstore/widgets/phone_card_name_user_row.dart';
import 'package:watchstore/widgets/product_payment_dashboard.dart';
import 'package:watchstore/widgets/surface_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) {
        final bloc = ProfileBloc(userRepository);
        bloc.add(UserInfoInit());
        return bloc;
      },
      child: SafeArea(
          child: Scaffold(
        appBar: const CustomAppBar(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                AppStrings.profile,
                style: LightAppTextStyle.title,
              ),
            ),
          ),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: LinearProgressIndicator(),
              );
            } else if (state is ProfileSucceed) {
              return SingleChildScrollView(
                child: SizedBox(
                  width: size.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Dimens.large),
                    child: Column(
                      children: [
                        Dimens.large.sizedBoxHeight,
                        ClipRRect(
                          borderRadius: BorderRadius.circular(500),
                          child: Image.asset(Assets.png.avatar.path),
                        ),
                        Dimens.medium.sizedBoxHeight,
                        Text(
                          state.userInfo.userInfo.name.toString(),
                          style: LightAppTextStyle.avatarTextStyle,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            AppStrings.activeAddress,
                            style: LightAppTextStyle.title.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Dimens.medium.sizedBoxHeight,
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  state.userInfo.userInfo.address.address,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: LightAppTextStyle.title
                                      .copyWith(fontSize: 14, height: 1.8),
                                ),
                              ),
                              IconButton(
                                  highlightColor:
                                      Colors.blueAccent.withOpacity(0.2),
                                  onPressed: () {},
                                  icon: SvgPicture.asset(Assets.svg.leftArrow)),
                            ],
                          ),
                        ),
                        Dimens.medium.sizedBoxHeight,
                        Container(
                          height: 1,
                          width: size.width,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        Dimens.medium.sizedBoxHeight,
                        PhoneCardNameUserRow(
                          svgIcon: Assets.svg.user,
                          title: state.userInfo.userInfo.name.toString(),
                        ),
                        PhoneCardNameUserRow(
                          svgIcon: Assets.svg.cart,
                          title: state.userInfo.userInfo.phone,
                        ),
                        PhoneCardNameUserRow(
                          svgIcon: Assets.svg.phone,
                          title: state.userInfo.userInfo.mobile.toString(),
                        ),
                        SurfaceContainer(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 5, top: 5, bottom: 5),
                            child: Text(
                              AppStrings.termOfService,
                              style: LightAppTextStyle.title.copyWith(
                                  fontWeight: FontWeight.w300, fontSize: 14),
                            ),
                          ),
                        ),
                        SurfaceContainer(
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 20, left: 10, right: 10),
                            height: size.height * 0.14,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ProductPaymentDashboard(
                                  svgIcon: Assets.svg.inProccess,
                                  title: AppStrings.inProccess,
                                  subtitle: state.userInfo.userProcessingCount
                                      .toString(),
                                ),
                                ProductPaymentDashboard(
                                  svgIcon: Assets.svg.cancelled,
                                  title: AppStrings.cancelled,
                                  subtitle:
                                      state.userInfo.userCancelCount.toString(),
                                ),
                                ProductPaymentDashboard(
                                  svgIcon: Assets.svg.delivered,
                                  title: AppStrings.delivered,
                                  subtitle: state.userInfo.userReceivedCount
                                      .toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(Dimens.medium),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimens.medium),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(Dimens.medium),
                            child: Image.asset(
                              Assets.png.slider.path,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is ProfileError) {
              return Center(
                child: TextButton(
                    onPressed: () {
                      BlocProvider.of<ProfileBloc>(context).add(UserInfoInit());
                    },
                    child: const Text(
                      'تلاش دوباره',
                      style: TextStyle(
                          fontFamily: FontFamily.dana,
                          color: Colors.black,
                          fontSize: 18),
                    )),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      )),
    );
  }
}
