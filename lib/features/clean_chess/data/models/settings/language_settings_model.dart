class LanguageSettingsModel {
  Languages _language;

  // Getters
  Languages get language => _language;

  // Setters
  set language(Languages value) => _language = value;

  LanguageSettingsModel({
    required Languages language,
  }) : _language = language;
}

enum Languages {
  english('English'),
  italian('Italiano'),
  turkish('Türkçe'),
  spanish('Español');

  const Languages(this.lang);

  final String lang;
}
