import { NativeModules } from 'react-native';
import type { LiveTranscriptionStatus } from './ZoomVideoSdk';
import { ZoomVideoSdkLiveTranscriptionLanguage } from './ZoomVideoSdkLiveTranscriptionLanguage';
import type { Errors } from '../native/ZoomVideoSdk';

const { RNZoomVideoSdkLiveTranscriptionHelper } = NativeModules;

export type ZoomVideoSdkLiveTranscriptionHelperType = {
  canStartLiveTranscription: () => Promise<boolean>;
  getLiveTranscriptionStatus: () => Promise<LiveTranscriptionStatus>;
  startLiveTranscription: () => Promise<Errors>;
  stopLiveTranscription: () => Promise<Errors>;
  getAvailableSpokenLanguages: () => Promise<
    ZoomVideoSdkLiveTranscriptionLanguage[]
  >;
  setSpokenLanguage: (languageId: number) => void;
  getSpokenLanguage: () => Promise<ZoomVideoSdkLiveTranscriptionLanguage>;
  getAvailableTranslationLanguages: () => Promise<
    ZoomVideoSdkLiveTranscriptionLanguage[]
  >;
  setTranslationLanguage: (languageId: number) => void;
  getTranslationLanguage: () => Promise<ZoomVideoSdkLiveTranscriptionLanguage>;
};

export class ZoomVideoSdkLiveTranscriptionHelper
  implements ZoomVideoSdkLiveTranscriptionHelperType
{
  async canStartLiveTranscription() {
    return await RNZoomVideoSdkLiveTranscriptionHelper.canStartLiveTranscription();
  }

  async getLiveTranscriptionStatus() {
    return await RNZoomVideoSdkLiveTranscriptionHelper.getLiveTranscriptionStatus();
  }

  async startLiveTranscription() {
    return await RNZoomVideoSdkLiveTranscriptionHelper.startLiveTranscription();
  }

  async stopLiveTranscription() {
    return await RNZoomVideoSdkLiveTranscriptionHelper.stopLiveTranscription();
  }

  async getAvailableSpokenLanguages() {
    const languages =
      await RNZoomVideoSdkLiveTranscriptionHelper.getAvailableSpokenLanguages();
    return languages.map(
      (language: ZoomVideoSdkLiveTranscriptionLanguage) =>
        new ZoomVideoSdkLiveTranscriptionLanguage(language)
    );
  }

  async setSpokenLanguage(languageId: number) {
    return await RNZoomVideoSdkLiveTranscriptionHelper.setSpokenLanguage(
      languageId
    );
  }

  async getSpokenLanguage() {
    const language =
      await RNZoomVideoSdkLiveTranscriptionHelper.getSpokenLanguage();
    return new ZoomVideoSdkLiveTranscriptionLanguage(language);
  }

  async getAvailableTranslationLanguages() {
    const languages =
      await RNZoomVideoSdkLiveTranscriptionHelper.getAvailableTranslationLanguages();
    return languages.map(
      (language: ZoomVideoSdkLiveTranscriptionLanguage) =>
        new ZoomVideoSdkLiveTranscriptionLanguage(language)
    );
  }

  async setTranslationLanguage(languageId: number) {
    return await RNZoomVideoSdkLiveTranscriptionHelper.setTranslationLanguage(
      languageId
    );
  }

  async getTranslationLanguage() {
    const language =
      await RNZoomVideoSdkLiveTranscriptionHelper.getTranslationLanguage();
    return new ZoomVideoSdkLiveTranscriptionLanguage(language);
  }
}
