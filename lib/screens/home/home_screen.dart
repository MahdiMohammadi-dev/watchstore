import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchstore/data/repository/home_repository.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';
import 'package:watchstore/screens/home/bloc/home_bloc.dart';
import 'package:watchstore/screens/product_list/product_list_screen.dart';
import 'package:watchstore/widgets/category_section.dart';
import 'package:watchstore/widgets/home_screen_slider.dart';
import 'package:watchstore/widgets/product_item.dart';
import 'package:watchstore/widgets/search_bar_section.dart';
import 'package:watchstore/widgets/vertical_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc(homeRepository);
        homeBloc.add(HomeInit());

        return homeBloc;
      },
      child: Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeSuccess) {
                return Column(
                  children: [
                    SearchBarSection(
                      onTap: () {},
                    ),
                    HomeScreenSlider(imgList: state.homeModel.sliders),

                    ///TODO:Category Section
                    SizedBox(
                      width: size.width,
                      height: size.height / 5.5,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.homeModel.categories.length,
                        itemBuilder: (context, index) {
                          var category = state.homeModel.categories[index];
                          List<LinearGradient> gradient = [
                            const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF8396E1), Color(0xFFE6FCFF)]),
                            const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFFE183D4),
                                  Color(0xFFFFE6F5),
                                ]),
                            const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 139, 162, 168),
                                  Color.fromARGB(255, 223, 238, 245),
                                ]),
                            const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 255, 166, 114),
                                  Color.fromARGB(255, 255, 227, 200),
                                ])
                          ];

                          LinearGradient selectedGradient =
                              gradient[index % gradient.length];

                          return CategorySection(
                              size: size,
                              titleCategory: category.title,
                              iconPath: category.image,
                              gradient: selectedGradient,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProductListScreen(
                                    params: category.id,
                                  ),
                                ));
                              });
                        },
                      ),
                    ),
                    Dimens.medium.sizedBoxHeight,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Row(children: [
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            // reverse: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: state.homeModel.amazingProduct.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => ProductItem(
                              productTitle:
                                  state.homeModel.amazingProduct[index].title,
                              productPrice:
                                  state.homeModel.amazingProduct[index].price,
                              productImage:
                                  state.homeModel.amazingProduct[index].image,
                              specialExpiration: state.homeModel
                                  .amazingProduct[index].special_expiration,
                              offPercentage: state
                                  .homeModel.amazingProduct[index].discount,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: Dimens.medium,
                        ),
                        const RotatedBox(
                            quarterTurns: -1, child: VerticalText())
                      ]),
                    )
                  ],
                );
              } else if (state is HomeError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text(
                        'عدم ارتباط با سرور',
                        style: TextStyle(fontFamily: 'dana'),
                      )));
                });
              } else {
                return const SizedBox();
              }
              return const SizedBox();
            },
          ),
        ),
      )),
    );
  }
}
