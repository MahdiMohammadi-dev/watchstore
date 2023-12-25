import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/extensions/number_sepration.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/colors.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/widgets/cart_badges.dart';
import 'package:watchstore/widgets/custom_app_bar.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const CartBadge(cartCount: 3),
                const Expanded(
                  child: Text(
                    'ساعت هوشمند ایسوس زن واچ2',
                    style: LightAppTextStyle.title,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(
                  width: Dimens.medium,
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Assets.svg.close),
                )
              ],
            ),
          )),
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.png.unnamed.path,
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(Dimens.medium),
                      padding: const EdgeInsets.all(Dimens.medium),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimens.medium)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'بنسر',
                            style: LightAppTextStyle.title,
                            textDirection: TextDirection.rtl,
                          ),
                          const Text(
                            'خمیر دندان بنسر 3 عددی',
                            style: LightAppTextStyle.hint,
                            textDirection: TextDirection.rtl,
                          ),
                          const Divider(),
                          const ProductTabView(),
                          35.sizedBoxHeight
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: size.height * 0.09,
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    63500.seperatednumber,
                                    style: LightAppTextStyle.bottomNavActive
                                        .copyWith(fontSize: 15),
                                  ),
                                  const CartBadge(
                                    cartCount: 20,
                                    visibility: false,
                                    percentVisibility: true,
                                  ),
                                ],
                              ),
                              Text(
                                122000.seperatednumber,
                                style: LightAppTextStyle.hint
                                    .copyWith(fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(Dimens.small),
                              elevation: 0,
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.small))),
                          onPressed: () {},
                          child: const Text(
                            'افزون به سبد خرید',
                            style: LightAppTextStyle.buttonText,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

List<String> tabs = ['خصوصیات', 'نقد و بررسی', 'نظرات'];

class _ProductTabViewState extends State<ProductTabView> {
  var isSelectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          child: ListView.builder(
              itemCount: tabs.length,
              scrollDirection: Axis.horizontal,
              itemExtent: MediaQuery.sizeOf(context).width / tabs.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(Dimens.medium),
                    child: Text(
                      tabs[index],
                      style: isSelectedIndex == index
                          ? LightAppTextStyle.title
                          : LightAppTextStyle.hint,
                    ),
                  ),
                );
              }),
        ),
        IndexedStack(
          index: isSelectedIndex,
          children: const [
            Features(),
            Review(),
            Comments(),
          ],
        )
      ],
    );
  }
}

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('خصوصیات');
  }
}

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("""
  لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.

""");
  }
}

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('نقد و بررسی');
  }
}
