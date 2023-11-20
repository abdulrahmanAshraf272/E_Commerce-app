import 'package:ecommerce_app/core/constant/image_assets.dart';
import 'package:ecommerce_app/core/localization/translation.dart';
import 'package:ecommerce_app/data/model/onboarding_model.dart';
import 'package:get/get.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: TranslationsValue.onboardingTitle1.key.tr,
      body: 'onboarding_subtitle1'.tr,
      image: AppImageAssets.onBoardingImageOne),
  OnBoardingModel(
      title: 'onboarding_title2'.tr,
      body: 'onboarding_subtitle2'.tr,
      image: AppImageAssets.onBoardingImageTwo),
  OnBoardingModel(
      title: 'onboarding_title3'.tr,
      body: 'onboarding_subtitle3'.tr,
      image: AppImageAssets.onBoardingImageThree),
];
