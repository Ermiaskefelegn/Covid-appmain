class Language {
  final int id;
  final String name;
  final String flag;
  final String languagecode;

  Language(this.id, this.flag, this.name, this.languagecode);

  static List<Language> languagelist() {
    return <Language>[
      Language(1, "", "አማርኛ", "am"),
      // Language(2, "", "Oromo", "orm"),
      // Language(3, "", "ትግርኛ", "ti"),
      // Language(4, "", "Somali", "so"),
      // Language(5, "", "Afar", "aa"),
      // Language(6, "", "Arabic", "ar"),
      Language(7, "", "English", "en"),
    ];
  }
}
