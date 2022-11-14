export type ZoomVideoSdkLiveTranscriptionLanguageType = {
  languageId: number;
  languageName: string;
};

export class ZoomVideoSdkLiveTranscriptionLanguage
  implements ZoomVideoSdkLiveTranscriptionLanguageType
{
  languageId;
  languageName;

  constructor(language: ZoomVideoSdkLiveTranscriptionLanguageType) {
    this.languageName = language.languageName;
    this.languageId = language.languageId;
  }
}
