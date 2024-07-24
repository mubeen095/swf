abstract class APIUrls{
  static const baseUrl = 'https://cms.arrtravelandtour.com.np';

  static const signup =  '$baseUrl/api/v1/auth/register';
  static const verifyOTP =  '$baseUrl/api/v1/auth/user/verify';
  static const login =  '$baseUrl/api/v1/auth/login';

  // upload doc
  static const uploadPersonalInfo = "$baseUrl/api/v1/personal/info";
  static const uploadPhotos = "$baseUrl/api/v1/upload/photo";
  static const uploadPassportInfo = "$baseUrl/api/v1/passport/info";
  static const uploadResume = "$baseUrl/api/v1/resume/info";
  static const uploadEduDocs = "$baseUrl/api/v1/educational/document";
  static const uploadLanguages = "$baseUrl/api/v1/language/info";
  static const uploadWorkHistory = "$baseUrl/api/v1/work/experience";
  static const uploadBankDetails = "$baseUrl/api/v1/bank/info";
  static const uploadCategories = "$baseUrl/api/v1/category/info";
}