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
