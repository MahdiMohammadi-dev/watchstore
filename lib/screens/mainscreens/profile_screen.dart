import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';
import 'package:watchstore/widgets/custom_app_bar.dart';
import 'package:watchstore/widgets/phone_card_name_user_row.dart';
import 'package:watchstore/widgets/product_payment_dashboard.dart';
import 'package:watchstore/widgets/surface_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
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
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.large),
            child: Column(
              children: [
                Dimens.large.sizedBoxHeight,
                ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Image.asset(Assets.png.avatar.path),
                ),
                Dimens.medium.sizedBoxHeight,
                const Text(
                  'مهدی محمدی',
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
                          'فلکه اول صادقیه، بلوار ایمانی، خیابان امام خمینی، پلاک ۱۶',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: LightAppTextStyle.title
                              .copyWith(fontSize: 14, height: 1.8),
                        ),
                      ),
                      IconButton(
                          highlightColor: Colors.blueAccent.withOpacity(0.2),
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
                  title: 'مهدی محمدی',
                ),
                PhoneCardNameUserRow(
                  svgIcon: Assets.svg.cart,
                  title: '6852369874125',
                ),
                PhoneCardNameUserRow(
                  svgIcon: Assets.svg.phone,
                  title: '02154848',
                ),
                SurfaceContainer(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5, top: 5, bottom: 5),
                    child: Text(
                      AppStrings.termOfService,
                      style: LightAppTextStyle.title
                          .copyWith(fontWeight: FontWeight.w300, fontSize: 14),
                    ),
                  ),
                ),
                SurfaceContainer(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                    height: size.height * 0.14,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductPaymentDashboard(
                          svgIcon: Assets.svg.inProccess,
                          title: AppStrings.inProccess,
                        ),
                        ProductPaymentDashboard(
                          svgIcon: Assets.svg.cancelled,
                          title: AppStrings.cancelled,
                        ),
                        ProductPaymentDashboard(
                          svgIcon: Assets.svg.delivered,
                          title: AppStrings.delivered,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(Dimens.medium),
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
      ),
    ));
  }
}
