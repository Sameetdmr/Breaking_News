// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:newspaper_app/utils/constants/ColorConstants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:newspaper_app/ui/newspaper/NewspaperPageViewModel.dart';
import 'package:newspaper_app/ui/newspaper/components/CustomLottie.dart';
import 'package:newspaper_app/utils/constants/App_Constants.dart';
import 'package:newspaper_app/utils/theme/container/CustomContainer.dart';
import 'package:newspaper_app/utils/theme/padding/CustomPadding.dart';

import '../../utils/theme/colors/ColorSchemeLight.dart';

part 'components/CustomCategoryContainer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  late NewspaperPageViewModel _newspaperPageViewModel;

  @override
  Widget build(BuildContext context) {
    _newspaperPageViewModel = Get.put(NewspaperPageViewModel());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: BuildAppbar(),
        body: Column(
          children: [
            Flexible(flex: 5, child: _buildTopContainer()),
            Flexible(flex: 1, child: Divider(color: ColorConstants.black)),
            Flexible(flex: 20, child: BuildNewsPaperListView(newspaperPageViewModel: _newspaperPageViewModel)),
          ],
        ),
      ),
    );
  }
}

class BuildNewsPaperListView extends StatelessWidget {
  NewspaperPageViewModel _newspaperPageViewModel;
  BuildNewsPaperListView({
    Key? key,
    required NewspaperPageViewModel newspaperPageViewModel,
  })  : _newspaperPageViewModel = newspaperPageViewModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: context.paddingLow,
          child: SizedBox(
            child: _newspaperPageViewModel.isLoading.value
                ? NewsListView(newspaperPageViewModel: _newspaperPageViewModel)
                : Center(
                    child: CustomLottie(
                    lottieUrl: App_Constants.LOTTIE_PATH_SPLASH_LOADING,
                  )),
          ),
        ));
  }
}

class BuildAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: context.onlyRightPaddingNormal,
          child: Icon(
            Icons.newspaper_outlined,
            color: Colors.black,
          ),
        )
      ],
      title: Text(
        App_Constants.appName,
        style: context.primaryTextTheme.titleLarge?.copyWith(color: Colors.black),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class NewsListView extends StatelessWidget {
  const NewsListView({
    Key? key,
    required NewspaperPageViewModel newspaperPageViewModel,
  })  : _newspaperPageViewModel = newspaperPageViewModel,
        super(key: key);

  final NewspaperPageViewModel _newspaperPageViewModel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
            color: ColorConstants.greyShade50,
            child: ListTile(
              title: Text(
                _newspaperPageViewModel.newspaperPM.value.titleList![index],
                style: context.primaryTextTheme.titleSmall?.copyWith(color: ColorConstants.black),
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
                            style: context.primaryTextTheme.labelMedium?.copyWith(color: ColorConstants.blue),
                          ),
                        ],
                      ),
                      Text(
                        _newspaperPageViewModel.newspaperPM.value.publishedList![index],
                        style: context.primaryTextTheme.bodySmall?.copyWith(color: ColorConstants.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
