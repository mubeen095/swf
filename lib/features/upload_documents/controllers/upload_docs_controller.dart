import 'dart:io';

import 'package:coffee_shop/core/helpers/helpers.dart';
import 'package:coffee_shop/core/network/network.dart';
import 'package:coffee_shop/dependency_injection.dart';
import 'package:coffee_shop/features/upload_documents/models/personal_info.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UploadDocsController {
  final NetworkClient _client;

  UploadDocsController({required NetworkClient client}) : _client = client;
  Future<Either<String, bool>> uploadPersonalInfo(
      PersonalInfo personalInfo) async {
    try {
      final response = await _client.post(
        url: APIUrls.uploadPersonalInfo,
        data: personalInfo.toJson(),
      );
      return right(true);
    } catch (e) {
      return left("error");
    }
  }

  Future<Either<String, bool>> uploadPhotos(
      File ppSizePhoto, fullSizePhoto) async {
    try {
      final map = {
        "passport_photo": await MultipartFile.fromFile(ppSizePhoto.path),
        "full_photo": await MultipartFile.fromFile(fullSizePhoto.path)
      };
      final response =
          await _client.uploadFormData(url: APIUrls.uploadPhotos, map: map);
      print(response);
      return right(true);
    } catch (e) {
      return left("error");
    }
  }

  Future<Either<String, bool>> uploadPassportInfo(
      File passportPhoto, String passportNumber, String issueDate) async {
    try {
      final map = {
        "passport_image": await MultipartFile.fromFile(passportPhoto.path),
        "passport_number": passportNumber,
        "passport_issue_date": issueDate,
      };
      final response = await _client.uploadFormData(
          url: APIUrls.uploadPassportInfo, map: map);
      print(response);
      return right(true);
    } catch (e) {
      return left("error");
    }
  }

  Future<Either<String, bool>> uploadResume(File resume) async {
    try {
      final map = {"resume_file": await MultipartFile.fromFile(resume.path)};
      final response =
          await _client.uploadFormData(url: APIUrls.uploadResume, map: map);
      print(response);
      return right(true);
    } catch (e) {
      return left("error");
    }
  }

  Future<Either<String, bool>> uploadEduDocs(
      File doc, String passyear, instituteName, level) async {
    try {
      final map = {
        "edu_doc[0]": await MultipartFile.fromFile(doc.path),
        "level[0]": level,
        "school_college_name[0]": instituteName,
        "pass_year[0]": passyear,
      };
      final response =
          await _client.uploadFormData(url: APIUrls.uploadEduDocs, map: map);
      print(response);
      return right(true);
    } catch (e) {
      return left("error");
    }
  }

  Future<Either<String, bool>> uploadLanguages(List<String> languages) async {
    try {
      Map<String, String> languageMap = {};

      languages.asMap().forEach((index, lan) {
        String key = 'language_name[$index]';
        languageMap[key] = lan;
      });
      final response = await _client.uploadFormData(
        url: APIUrls.uploadLanguages,
        map: languageMap,
      );
      print(response);
      return right(true);
    } catch (e) {
      return left("error");
    }
  }
   Future<Either<String, bool>> uploadWorkExperience(String position,companyName, address,description )async {
    try {
    
      final response = await _client.uploadFormData(
        url: APIUrls.uploadWorkHistory,
        map: {
          "position[0]":position,
          "company_name[0]":companyName,
          "address[0]":address,
          "description[0]":description,
        },
      );
      print(response);
      return right(true);
    } catch (e) {
      return left("error");
    }
  }
   Future<Either<String, bool>> uploadBankDetails(String bankeName,branch, holdersName,acNumber )async {
    try {
    
      final response = await _client.uploadFormData(
        url: APIUrls.uploadBankDetails,
        map: {
          "bank_name":bankeName,
          "branch":branch,
          "account_holder_name":holdersName,
          "account_no":acNumber,
        },
      );
      print(response);
      return right(true);
    } catch (e) {
      return left("error");
    }
  }

  Future<Either<String, bool>> uploadCompanyCategories(List<String> categories )async {
    try {
       Map<String, String> categoriesMap = {};

      categories.asMap().forEach((index, cat) {
        String key = 'category_name[$index]';
        categoriesMap[key] = cat;
      });


      final response = await _client.uploadFormData(
        url: APIUrls.uploadCategories,
        map: categoriesMap,
      );
       final cacheManager = getIt.get<CacheManager>();
        await cacheManager.saveUserDocsStatus();
      print(response);
      return right(true);
    } catch (e) {
      return left("error");
    }
  }
}
