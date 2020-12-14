

class MainScreenModel {
  final String name;
  final String title;
  final String linkedin;
  final String skype;
  final String github;
  final String email;
  final String description;
  final String image;
  final String linkedInIcon;
  final String skypeIcon;
  final String gitHubIcon;
  final String emailIcon;
  final List<SkillsModel> skills;

  MainScreenModel(
      {this.name,
        this.title,
        this.linkedin,
        this.skype,
        this.github,
        this.email,
        this.description,
        this.image,
        this.linkedInIcon,
        this.skypeIcon,
        this.gitHubIcon,
        this.emailIcon,
        this.skills,
      });

  factory MainScreenModel.fromJson(Map<String, dynamic> data) {
    var json = data['profile'];
    List<dynamic> skills = json['skills'];
    List<SkillsModel> tmpList = [];
    if (skills != null) {
      for (int i = 0; i < skills.length; i++) {
        tmpList.add(
          SkillsModel.fromJson(skills[i]),
        );
      }
    }

    return MainScreenModel(
      name: json['name'],
      title: json['title'],
      linkedin: json['linkedin'],
      skype: json['skype'],
      github: json['github'],
      email: json['email'],
      description: json['description'],
      image: json['image'],
      linkedInIcon: json['linkedInIcon'],
      skypeIcon: json['skypeIcon'],
      gitHubIcon: json['gitHubIcon'],
      emailIcon: json['emailIcon'],
      skills: tmpList,
    );
  }
}



class SkillsModel {
  final int id;
  final String name;

  SkillsModel({this.id, this.name});

  factory SkillsModel.fromJson(Map<String,dynamic> json)
  {
    return SkillsModel(
      id: json['id'],
      name: json['name']
    );
  }

}
