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
    }
    return 0;
}


/*
https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/WorkingwithBlocks/WorkingwithBlocks.html#//apple_ref/doc/uid/TP40011210-CH8-SW1
https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/OperationObjects/OperationObjects.html#//apple_ref/doc/uid/TP40008091-CH101
https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40008091-CH1-SW1
https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Blocks/Articles/bxGettingStarted.html#//apple_ref/doc/uid/TP40007502-CH7-SW1

*/
