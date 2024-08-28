class Language {
  final int id;
  final name;
  final languageCode;

  Language(this.id, this.languageCode, this.name);

  static List<Language> languageList(){
    return <Language>[
      Language(1, "English", "en"),
      Language(2, "Tiếng Việt", "vi")
    ];
  }
}