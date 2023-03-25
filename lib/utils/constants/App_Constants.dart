class App_Constants {
  static App_Constants? _instance;

  static App_Constants get instance {
    return _instance ??= App_Constants._init();
  }

  App_Constants._init();

  //Category Lottie Constants
  static const ALLNEWS_LOTTIE_PATH = "";
  static const BUSINESS_LOTTIE_PATH = "assets/lottie/lottie_business.json";
  static const ENTERTAINMENT_LOTTIE_PATH = "assets/lottie/lottie_entertainment.json";
  static const HEALTH_LOTTIE_PATH = "assets/lottie/lottie_health.json";
  static const SCIENCE_LOTTIE_PATH = "assets/lottie/lottie_science.json";
  static const SPORT_LOTTIE_PATH = "assets/lottie/lottie_sport.json";
  static const TECHNOLOGY_LOTTIE_PATH = "assets/lottie/lottie_technology.json";

  //Category Name Contants
  static const CATEGORY_ALLNEWS = "Hepsi";
  static const CATEGORY_BUSINESS = "İş";
  static const CATEGORY_ENTERTAINMENT = "Eğlence";
  static const CATEGORY_HEALTH = "Sağlık";
  static const CATEGORY_SCIENCE = "Bilim";
  static const CATEGORY_SPORT = "Spor";
  static const CATEGORY_TECHNOLOGY = "Teknoloji";

  //Country Constants
  static const COUNTRY_TURKEY = "Türkiye";
  static const TURKEY_KEY = "tr";

  //Lottie Path
  static const LOTTIE_PATH_SPLASH_LOADING = "assets/lottie/loading_animation.json";
  static const LOTTIE_PATH_IMAGE_LOADING = "assets/lottie/circular_loading.json";
}
