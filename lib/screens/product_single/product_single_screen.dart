import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/data/repository/product_repository.dart';
import 'package:watchstore/extensions/number_sepration.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/gen/fonts.gen.dart';
import 'package:watchstore/resouece/colors.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/screens/product_single/bloc/product_single_bloc.dart';
import 'package:watchstore/widgets/cart_badges.dart';
import 'package:watchstore/widgets/custom_app_bar.dart';

class ProductSingleScreen extends StatelessWidget {
  final id;

  const ProductSingleScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) {
        final bloc = ProductSingleBloc(productRepository);
        bloc.add(ProductSingleInit(id: id));
        return bloc;
      },
      child: BlocConsumer<ProductSingleBloc, ProductSingleState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProductSingleError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(
                  'خطا در ارتباط با سرور',
                  style: TextStyle(
                    fontFamily: FontFamily.dana,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ));
            });
          } else if (state is ProductSingleLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductSingleLoaded) {
            return SafeArea(
              child: Scaffold(
                  appBar: CustomAppBar(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CartBadge(cartCount: 3),
                        Expanded(
                          child: Text(
                            state.productDetails.title.toString(),
                            style: LightAppTextStyle.title,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        const SizedBox(
                          width: Dimens.medium,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
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
                            Image.network(
                              state.productDetails.image.toString(),
                              width: size.width,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(Dimens.medium),
                              padding: const EdgeInsets.all(Dimens.medium),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(Dimens.medium)),
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
                          height: size.height * 0.11,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            63500.seperatednumber,
                                            style: LightAppTextStyle
                                                .bottomNavActive
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
                                      padding:
                                          const EdgeInsets.all(Dimens.small),
                                      elevation: 0,
                                      backgroundColor: AppColors.primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              Dimens.small))),
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
          return const SizedBox();
        },
      ),
    );
  }
}

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

List<String> tabs = ['نظرات', 'نقد و بررسی', 'خصوصیات'];

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
            Comments(),
            Features(),
            Review(),
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
    return const Text(
      """
  لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.

""",
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
    );
  }
}

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('نقد و بررسی');
  }
}
