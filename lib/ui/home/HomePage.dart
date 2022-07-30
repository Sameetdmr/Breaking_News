// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper_app/ui/components/CustomLottie.dart';
import 'package:newspaper_app/ui/home/HomePageViewModel.dart';
import 'package:newspaper_app/utils/theme/CustomTextTheme.dart';
import 'package:newspaper_app/utils/theme/colors/ColorSchemeLight.dart';
import 'package:newspaper_app/utils/theme/container/CustomContainer.dart';
import 'package:newspaper_app/utils/theme/padding/CustomPadding.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  late HomePageViewModel _homePageViewModel;

  @override
  Widget build(BuildContext context) {
    _homePageViewModel = Get.put(HomePageViewModel());
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 2, child: _buildTopContainer(width)),
            Expanded(flex: 9, child: _buildNewspaperListView()),
          ],
        ),
      ),
    );
  }

  Widget _buildNewspaperListView() {
    return Obx(() => Container(
          child: _homePageViewModel.isLoading.value
              ? ListView.separated(
                  shrinkWrap: true,
                  itemCount: _homePageViewModel.newspaperPM.value.titleList!.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: ColorSchemeLight.instance.dusk40Color,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 5,
                      color: Colors.grey.shade200,
                      child: ListTile(
                        title: Text(
                          _homePageViewModel.newspaperPM.value.titleList![index],
                          style: CustomTextTheme.instance.cardTitleText,
                        ),
                        subtitle: Padding(
                          padding: CustomPadding.instance.subtitleTopPadding,
                          child: GestureDetector(
                            onTap: () async {
                              if (!await launch(_homePageViewModel.newspaperPM.value.urlList![index])) ;
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.open_in_new,
                                      size: 12,
                                    ),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      _homePageViewModel.newspaperPM.value.nameList![index],
                                      style: CustomTextTheme.instance.cardSubtitleText,
                                    ),
                                  ],
                                ),
                                Text(
                                  _homePageViewModel.newspaperPM.value.publishedList![index],
                                  style: CustomTextTheme.instance.cardSubtitleText.copyWith(fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                        ),
                        trailing: CachedNetworkImage(
                          width: CustomContainer.instance.cacheNetworkImageWidth,
                          height: CustomContainer.instance.cacheNetworkImageHeight,
                          imageUrl: _homePageViewModel.newspaperPM.value.imageList![index],
                          fit: BoxFit.cover,
                          placeholder: (context, url) => CustomLottie(lottieUrl: 'assets/lottie/loading-animation.json'),
                          errorWidget: (context, url, error) =>
                              Container(height: CustomContainer.instance.cacheNetworkImageHeight, width: CustomContainer.instance.cacheNetworkImageWidth, child: Image.asset("assets/images/img_bulunamadi.png", fit: BoxFit.contain)),
                        ),
                      ),
                    );
                  })
              : Center(
                  child: CustomLottie(
                  lottieUrl: 'assets/lottie/loading_animation.json',
                )),
        ));
  }

  Widget _buildTopContainer(double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.only(
            bottomLeft: CustomPadding.instance.topContainerLeftRadiusCircular,
          )),
      child: Padding(
        padding: CustomPadding.instance.topContainerPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleAndDate(),
            _buildCategory(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory() {
    return Container(
      height: CustomContainer.instance.categoryContainerHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        itemCount: _homePageViewModel.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: CustomPadding.instance.topContainerTitleTopPadding,
            child: _buildCategoryList(index),
          );
        },
      ),
    );
  }

  Widget _buildCategoryList(int index) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          _homePageViewModel.categoryIndex.value = index;
          _homePageViewModel.fetchIndexNews(index);
        },
        child: Row(
          children: [
            Column(
              children: [
                index == 0
                    ? _buildAnimatedContainer(
                        index,
                        Icon(
                          Icons.wifi_tethering,
                          color: Colors.white,
                          size: 40,
                        ),
                      )
                    : _buildAnimatedContainer(index, null),
                SizedBox(
                  height: 5,
                ),
                Text(_homePageViewModel.categoryList[index].title, style: _homePageViewModel.categoryIndex.value == index ? CustomTextTheme.instance.boldSubtitleText.copyWith(fontWeight: FontWeight.bold) : CustomTextTheme.instance.boldSubtitleText)
              ],
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer _buildAnimatedContainer(int index, Widget? child) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: CustomContainer.instance.animatedContainerWidth,
      height: CustomContainer.instance.animatedContainerHeight,
      decoration: BoxDecoration(
        border: _homePageViewModel.categoryIndex.value == index ? Border.all(color: Colors.green, width: 2) : Border.all(color: Colors.white),
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage(_homePageViewModel.categoryList[index].image),
            fit: BoxFit.fill,
            onError: (Object? exception, StackTrace? stackTrace) {
              Image.asset(
                "assets/images/img_bulunamadi.png",
                fit: BoxFit.contain,
              );
            }),
      ),
      child: child,
    );
  }

  Widget _buildTitleAndDate() {
    String _title = 'Haberler';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _title,
          style: CustomTextTheme.instance.boldTopTitleText,
        ),
        SizedBox(height: 5),
        Text(
          _homePageViewModel.getDateTime(),
          style: CustomTextTheme.instance.boldSubtitleText,
        ),
      ],
    );
  }
}
