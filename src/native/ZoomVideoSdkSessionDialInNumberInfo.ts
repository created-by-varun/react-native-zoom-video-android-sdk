import type {ZoomVideoSDKDialInNumberType} from './ZoomVideoSdk';

export type ZoomVideoSdkSessionDialInNumberInfoType = {
    countryId: string;
    countryCode: string;
    countryName: string;
    number: string;
    displayNumber: string;
    type: ZoomVideoSDKDialInNumberType;
};

export class ZoomVideoSdkSessionDialInNumberInfo implements ZoomVideoSdkSessionDialInNumberInfoType {
    countryId;
    countryCode;
    countryName;
    number;
    displayNumber;
    type;

    constructor(sessionDialInNumberInfo: ZoomVideoSdkSessionDialInNumberInfoType) {
        this.countryId = sessionDialInNumberInfo.countryId;
        this.countryCode = sessionDialInNumberInfo.countryCode;
        this.countryName = sessionDialInNumberInfo.countryName;
        this.number = sessionDialInNumberInfo.number;
        this.displayNumber =sessionDialInNumberInfo.displayNumber;
        this.type = sessionDialInNumberInfo.type;
    }
}