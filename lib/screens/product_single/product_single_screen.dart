import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/data/model/product_details_model/comment.dart';
import 'package:watchstore/data/model/product_details_model/product_details_model.dart';
import 'package:watchstore/data/model/product_details_model/property.dart';
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
      child: SafeArea(
        child: BlocConsumer<ProductSingleBloc, ProductSingleState>(
            listener: (context, state) {
          // TODO: implement listener
        }, builder: (context, state) {
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
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is ProductSingleLoaded) {
            return Scaffold(
                appBar: CustomAppBar(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const CartBadge(cartCount: 3),
                      const SizedBox(
                        width: Dimens.small,
                      ),
                      Expanded(
                        child: FittedBox(
                          child: Text(
                            state.productDetails.title.toString(),
                            style: LightAppTextStyle.title,
                            textDirection: TextDirection.rtl,
                          ),
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
                            width: size.width - 100,
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
                                Text(
                                  state.productDetails.brand.toString(),
                                  style: LightAppTextStyle.title,
                                  textDirection: TextDirection.rtl,
                                ),
                                Text(
                                  state.productDetails.title.toString(),
                                  style: LightAppTextStyle.hint,
                                  textDirection: TextDirection.rtl,
                                ),
                                const Divider(),
                                ProductTabView(
                                  productDetailsModel: state.productDetails,
                                ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    padding: const EdgeInsets.all(Dimens.small),
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
                ));
          } else {
            throw Exception('Unknown error');
          }
          return const SizedBox();
        }),
      ),
    );
  }
}

class ProductTabView extends StatefulWidget {
  final ProductDetailsModel productDetailsModel;
  const ProductTabView({super.key, required this.productDetailsModel});

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
          children: [
            Comments(
              comments: widget.productDetailsModel.comments!,
            ),
            Review(
              title: widget.productDetailsModel.discussion.toString(),
            ),
            PropertyList(
              propertyList: widget.productDetailsModel.properties!,
            ),
          ],
        )
      ],
    );
  }
}

class PropertyList extends StatelessWidget {
  final List<Property> propertyList;
  PropertyList({super.key, required this.propertyList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: propertyList.length,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.all(Dimens.medium),
          padding: const EdgeInsets.all(Dimens.medium),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 252, 245, 245)),
          child: Text(
            "${propertyList[index].property}:${propertyList[index].value!}",
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: TextStyle(fontFamily: FontFamily.dana),
          ),
        );
      },
    ));
  }
}

class Comments extends StatelessWidget {
  final List<Comment> comments;

  const Comments({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: comments.length,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 252, 245, 245)),
          width: double.infinity,
          margin: const EdgeInsets.all(Dimens.medium),
          padding: const EdgeInsets.all(Dimens.medium),
          child: Text(
            "${comments[index].user}:${comments[index].body!}",
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: TextStyle(fontFamily: FontFamily.dana),
          ),
        );
      },
    ));
  }
}

class Review extends StatelessWidget {
  final String title;
  const Review({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text(
        title,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        maxLines: 10,
        style: const TextStyle(
            fontFamily: FontFamily.sans,
            fontWeight: FontWeight.w400,
            height: 1.8),
      ),
    );
  }
}
