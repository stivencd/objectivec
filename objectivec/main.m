//
//  main.m
//  objectivec
//
//  Created by stiven on 16/6/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        void (^simpleBlock)(void) = ^ {
            NSLog(@"simple block");
        };
        simpleBlock();
        
        double (^sumTwoValues) (double a, double b) = ^(double a, double b){
            return a+b;
        };
        double sum = sumTwoValues(10,20);
        NSLog(@"sum: %f", sum );
        
        char *myCharacter[] = {"Juan", "Carlos", "Maria"};
        qsort_b(myCharacter, 3, sizeof(char *), ^(const void *l, const void *r){
            char *left = *(char **) l;
            char *right = *(char **)r;
            return strncmp(left, right, 1);
        });
        
        for(int k=0; k<3; k++){
            NSLog(@" value => %s", myCharacter[k]);
        }
        
        NSArray *stringsArray = @[
            @"String 1",
            @"string 01",
            @"string 23",
            @"string 00",
            @"String 00"
        ];
        static NSStringCompareOptions compareOptions = NSCaseInsensitiveSearch | NSNumericSearch | NSWidthInsensitiveSearch | NSForcedOrderingSearch;
        NSLocale *currentLocale = [NSLocale currentLocale];
        __block NSUInteger orderedSameCount = 0;
        NSComparator finderSortBlock = ^(id string1, id string2) {
            NSRange string1Range = NSMakeRange(0, [string1 length]);
            NSComparisonResult comparisonResult = [string1 compare:string2 options:compareOptions range:string1Range locale:currentLocale];
            if(comparisonResult == orderedSameCount) {
                orderedSameCount ++;
            }
            return comparisonResult;
        };
        
        NSArray *finderSortArray = [stringsArray sortedArrayUsingComparator: finderSortBlock];
        NSLog(@"finderSortArray: %@", finderSortArray);
        
        //NSString *greeting = NSLocalizedStringFromTable(@"Hello", @"greeting to present in first launch panel", @"greetings");
        //NSLog(@"localized: %@", [greeting valueForKey:@"Hello"] );
        
        //Declaro
        float (^oneFront)(float);
        oneFront = ^(float val){
            float result = val -1;
            return result;
        };
        NSLog(@"block1:  %f", oneFront(1));
        
        NSString *s = [NSString stringWithUTF8String:"Long dash symbol México"];
        NSLog(@"%@",s);
        
        char *myChars[] = {"México", "Bolivia"};
        for(int k=0; k < 2; k++){
            NSString * stringUTF8 = [NSString stringWithUTF8String:myChars[k]];
            NSLog(@"utf8: %@", stringUTF8);
        }
        
        NSArray *countries = @[
            @{
               @"isoAlpha2": @"BO",
               @"isoAlpha3": @"BOL",
               @"nameEnglish": @"Bolivia",
               @"nameSpanish": @"Bolivia",
               @"dialCode": @"591",
               @"latitude": @-17,
               @"longitude": @-65,
               @"emojiFlag": @"🇧🇴"
            },
            @{
               @"isoAlpha2": @"BR",
               @"isoAlpha3": @"BRA",
               @"nameEnglish": @"Brazil",
               @"nameSpanish": @"Brasil",
               @"dialCode": @"55",
               @"latitude": @-10,
               @"longitude": @-55,
               @"emojiFlag": @"🇧🇷"
            },
            @{
              @"isoAlpha2": @"BB",
              @"isoAlpha3": @"BRB",
              @"nameEnglish": @"Barbados",
              @"nameSpanish": @"Barbados",
              @"dialCode": @"1246",
              @"latitude": @13.16666666,
              @"longitude": @-59.53333333,
              @"emojiFlag": @"🇧🇧"
            }];
            
            NSArray *countriesCode = @[@"591"];
            NSPredicate *predicate = [NSPredicate predicateWithFormat: @"dialCode IN %@", countriesCode ];
            NSArray *filtered = [countries filteredArrayUsingPredicate: predicate];
            NSLog(@"filtered ---> %@", filtered);
            
    }
    return 0;
}


/*
 
 https://developer.apple.com/library/archive/navigation/
 
https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/WorkingwithBlocks/WorkingwithBlocks.html#//apple_ref/doc/uid/TP40011210-CH8-SW1
https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/OperationObjects/OperationObjects.html#//apple_ref/doc/uid/TP40008091-CH101
https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40008091-CH1-SW1
https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Blocks/Articles/bxGettingStarted.html#//apple_ref/doc/uid/TP40007502-CH7-SW1
https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Strings/Articles/SearchingStrings.html
 https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPInternational/Introduction/Introduction.html#//apple_ref/doc/uid/10000171i
 https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/Articles/pSyntax.html#//apple_ref/doc/uid/TP40001795-SW1
 https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/Articles/pSyntax.html#//apple_ref/doc/uid/TP40001795-SW1

*/
