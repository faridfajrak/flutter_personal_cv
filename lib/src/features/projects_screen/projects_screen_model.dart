import 'package:flutter/cupertino.dart';

class ProjectsModel {
  final List<ProjectModel> projects;

  ProjectsModel({this.projects});

  factory ProjectsModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> projects = json['projects'];
    List<ProjectModel> tmpList = [];
    if (projects != null) {
      for (int i = 0; i < projects.length; i++) {
        tmpList.add(
          ProjectModel.fromJson(projects[i]),
        );
      }
    }
    return ProjectsModel(projects: tmpList);
  }
}

class ProjectModel {
  final int id;
  final String name;
  final String description;
  final String pwa_link;
  final String play_store_link;
  final String apple_store_link;
  final String web_link;
  final String github_link;
  final String other_link;
  final List<String> screens;

  final String video;
  final List<PlatformsModel> platforms;
  final List<TechnologyModel> technology;

  ProjectModel(
      {this.id,
      this.name,
      this.description,
      this.pwa_link,
      this.play_store_link,
      this.apple_store_link,
      this.web_link,
      this.github_link,
      this.other_link,
      this.screens,
      this.video,
      this.platforms,
      this.technology});

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> platforms = json['platforms'];
    List<PlatformsModel> tmpPlat = [];
    List<dynamic> tech = json['technology'];
    List<TechnologyModel> tmpTech = [];

    if (platforms != null) {
      for (int i = 0; i < platforms.length; i++) {
        tmpPlat.add(
          PlatformsModel.fromJson(platforms[i]),
        );
      }
    }

    if (tech != null) {
      for (int i = 0; i < tech.length; i++) {
        tmpTech.add(
          TechnologyModel.fromJson(tech[i]),
        );
      }
    }

    List<String> screens = [json['pic_1'], json['pic_2'], json['pic_3']];

    return ProjectModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pwa_link: json['pwa_link'],
        play_store_link: json['play_store_link'],
        apple_store_link: json['apple_store_link'],
        web_link: json['web_link'],
        github_link: json['github_link'],
        other_link: json['other_link'],
        screens: screens,
        video: json['video'],
        platforms: tmpPlat,
        technology: tmpTech);
  }
}

class PlatformsModel {
  final int id;
  final String name;

  PlatformsModel({this.id, this.name});

  factory PlatformsModel.fromJson(Map<String, dynamic> json) {
    return PlatformsModel(id: json['id'], name: json['name']);
  }
}

class TechnologyModel {
  final int id;
  final String name;

  TechnologyModel({this.id, this.name});

  factory TechnologyModel.fromJson(Map<String, dynamic> json) {
    return TechnologyModel(id: json['id'], name: json['name']);
  }
}
