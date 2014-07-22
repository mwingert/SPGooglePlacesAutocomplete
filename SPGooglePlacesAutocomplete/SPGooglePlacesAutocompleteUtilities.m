//
//  SPGooglePlacesAutocompleteUtilities.m
//  SPGooglePlacesAutocomplete
//
//  Created by Stephen Poletto on 7/18/12.
//  Copyright (c) 2012 Stephen Poletto. All rights reserved.
//

#import "SPGooglePlacesAutocompleteUtilities.h"

@implementation NSArray(SPFoundationAdditions)
- (id)onlyObject {
    return [self count] >= 1 ? self[0] : nil;
}
@end

SPGooglePlacesAutocompletePlaceType SPPlaceTypeFromDictionary(NSDictionary *placeDictionary) {
	NSArray *types = placeDictionary[@"types"];
    if ([types containsObject:@"establishment"]) {
		return SPPlaceTypeEstablishment;
	} else if ([types containsObject:@"geocode"]) {
		return  SPPlaceTypeGeocode;
	} else if ([types containsObject:@"(cities)"]) {
		return SPPlaceTypeCities;
	} else {
		return SPPlaceTypeInvalid;
	}
}

NSString *SPBooleanStringForBool(BOOL boolean) {
    return boolean ? @"true" : @"false";
}

NSString *SPPlaceTypeStringForPlaceType(SPGooglePlacesAutocompletePlaceType type) {
    NSDictionary *typeStrings = @{[NSNumber numberWithInt:SPPlaceTypeEstablishment] : @"establishment",
								  [NSNumber numberWithInt:SPPlaceTypeGeocode] : @"geocode",
								  [NSNumber numberWithInt:SPPlaceTypeCities] : @"(cities)",
								  [NSNumber numberWithInt:SPPlaceTypeInvalid] : @""
								  };
    return typeStrings[[NSNumber numberWithInt:type]];
}

extern BOOL SPIsEmptyString(NSString *string) {
    return !string || ![string length];
}