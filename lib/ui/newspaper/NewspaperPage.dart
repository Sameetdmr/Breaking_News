// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:newspaper_app/ui/components/CustomLottie.dart';
import 'package:newspaper_app/ui/newspaper/NewspaperPageViewModel.dart';
import 'package:newspaper_app/utils/constants/App_Constants.dart';
import 'package:newspaper_app/utils/theme/container/CustomContainer.dart';
import 'package:newspaper_app/utils/theme/padding/CustomPadding.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/theme/colors/ColorSchemeLight.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  late NewspaperPageViewModel _newspaperPageViewModel;

  @override
  Widget build(BuildContext context) {
    _newspaperPageViewModel = Get.put(NewspaperPageViewModel());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 0.16.sh.toInt(), child: _buildTopContainer(context)),
            Expanded(flex: 0.84.sh.toInt(), child: _buildNewspaperListView(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildNewspaperListView(BuildContext context) {
    return Obx(() => Padding(
          padding: context.paddingLow,
          child: Container(
            child: _newspaperPageViewModel.isLoading.value
                ? RefreshIndicator(
                    color: Colors.green, //TODO COLOR
                    onRefresh: () async {
                      await Future.delayed(context.durationSlow);
                      _newspaperPageViewModel.newspaperPM.refresh();
                      return;
                    },
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: _newspaperPageViewModel.newspaperPM.value.titleList!.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: ColorSchemeLight.instance.dusk40Color,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 5,
                            color: Colors.grey.shade200, // TODO COLOR
                            child: ListTile(
                              title: Text(
                                _newspaperPageViewModel.newspaperPM.value.titleList![index],
                                style: context.primaryTextTheme.titleSmall?.copyWith(color: Colors.black), //TODO RENK
                              ),
                              subtitle: Padding(
                                padding: context.onlyTopPaddingLow,
                                child: GestureDetector(
                                  onTap: () async {
                                    if (!await launch(_newspaperPageViewModel.newspaperPM.value.urlList![index])) ;
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.open_in_new,
                                            size: 15,
                                          ),
                                          context.emptySizedHeightBoxLow3x,
                                          Text(
                                            _newspaperPageViewModel.newspaperPM.value.nameList![index],
                                            style: context.primaryTextTheme.labelMedium?.copyWith(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        _newspaperPageViewModel.newspaperPM.value.publishedList![index],
                                        style: context.primaryTextTheme.bodySmall?.copyWith(color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                : Center(
                    child: CustomLottie(
                    lottieUrl: App_Constants.LOTTIE_PATH_SPLASH_LOADING,
                  )),
          ),
        ));
  }

  Widget _buildTopContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade100, //TODO RENK
          borderRadius: BorderRadius.only(
            bottomLeft: CustomPadding.instance.topContainerLeftRadiusCircular,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategory(context),
        ],
      ),
    );
  }

  Widget _buildCategory(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Container(
        height: CustomContainer.instance.categoryContainerHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: _newspaperPageViewModel.categoryList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: context.onlyTopPaddingLow,
              child: _buildCategoryList(index, context),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryList(int index, BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          _newspaperPageViewModel.categoryIndex.value = index;
          _newspaperPageViewModel.fetchIndexNews(index);
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
                          color: Colors.white, //TODO COLOR
                          size: 30,
                        ),
                      )
                    : _buildAnimatedContainer(index, null),
                Text(
                  _newspaperPageViewModel.categoryList[index].title,
                  style: _newspaperPageViewModel.categoryIndex.value == index ? context.primaryTextTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.black) : context.primaryTextTheme.bodyMedium?.copyWith(color: Colors.black),
                )
              ],
            ),
            context.emptySizedWidthBoxNormal,
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedContainer(int index, Widget? child) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: CustomContainer.instance.animatedContainerWidth,
      height: CustomContainer.instance.animatedContainerHeight,
      decoration: BoxDecoration(
        border: _newspaperPageViewModel.categoryIndex.value == index ? Border.all(color: Colors.green, width: 2) : Border.all(color: Colors.white), //TODO RENK
        shape: BoxShape.circle,
      ),
      child: child == null
          ? CustomLottie(
              lottieUrl: _newspaperPageViewModel.categoryList[index].image,
            )
          : child,
    );
  }
}
