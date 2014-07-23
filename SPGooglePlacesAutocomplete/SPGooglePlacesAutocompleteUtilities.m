//
//  SPGooglePlacesAutocompleteUtilities.m
//  SPGooglePlacesAutocomplete
//
//  Created by Stephen Poletto on 7/18/12.
//  Copyright (c) 2012 Stephen Poletto. All rights reserved.
//

#import "SPGooglePlacesAutocompleteUtilities.h"

static const NSString *SPPlaceTypeStringInvalid = @"";
static const NSString *SPPlaceTypeStringGeocode = @"geocode";
static const NSString *SPPlaceTypeStringEstablishment = @"establishment";
static const NSString *SPPlaceTypeStringCities = @"(cities)";

static const NSString *SPBooleanStringTrue = @"true";
static const NSString *SPBooleanStringFalse = @"false";

@implementation NSArray(SPFoundationAdditions)
- (id)onlyObject {
    return [self count] >= 1 ? self[0] : nil;
}
@end

SPGooglePlacesAutocompletePlaceType SPPlaceTypeFromDictionary(NSDictionary *placeDictionary) {
	NSArray *types = placeDictionary[@"types"];
    if ([types containsObject:SPPlaceTypeStringEstablishment]) {
		return SPPlaceTypeEstablishment;
	} else if ([types containsObject:SPPlaceTypeStringGeocode]) {
		return  SPPlaceTypeGeocode;
	} else if ([types containsObject:SPPlaceTypeStringCities]) {
		return SPPlaceTypeCities;
	} else {
		return SPPlaceTypeInvalid;
	}
}

NSString *SPBooleanStringForBool(BOOL boolean) {
    return boolean ? SPBooleanStringTrue : SPBooleanStringFalse;
}

NSString *SPPlaceTypeStringForPlaceType(SPGooglePlacesAutocompletePlaceType type) {
    NSDictionary *typeStrings = @{@(SPPlaceTypeEstablishment) : SPPlaceTypeStringEstablishment,
								  @(SPPlaceTypeGeocode) : SPPlaceTypeStringGeocode,
								  @(SPPlaceTypeCities) : SPPlaceTypeStringCities,
								  @(SPPlaceTypeInvalid) : SPPlaceTypeStringInvalid
								  };
    return typeStrings[@(type)];
}

extern BOOL SPIsEmptyString(NSString *string) {
    return !string || ![string length];
}