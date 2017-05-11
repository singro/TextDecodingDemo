//
//  ViewController.m
//  TextDecodingDemo
//
//  Created by Singro on 10/05/2017.
//  Copyright © 2017 Singro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *boundlePath = [[NSBundle mainBundle] pathForResource:@"Untitled" ofType:@"txt"];
    
    NSData *data = [NSData dataWithContentsOfFile:boundlePath];
    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    
    NSString *content = [[NSString alloc] initWithData:data encoding:encoding];
    NSLog(@"content: %@", content);
    
    
    // writeToFile test
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = paths.firstObject;
    path = [path stringByAppendingString:@"/writeToFile.txt"];
    
    NSLog(@"path:\n%@", path);
    NSError *error2 = nil;
    
    [content writeToURL:[NSURL fileURLWithPath:path] atomically:YES encoding:encoding error:&error2];
    if (error2)
    {
        NSLog(@"writeToFile failure");
    }
    
    
    NSInteger contentSize = [content lengthOfBytesUsingEncoding:encoding];
    
    NSLog(@"size: %zd", contentSize);
    
    if ([content canBeConvertedToEncoding:encoding])
    {
        NSLog(@"can...");
    }
    
    
    @try {
        
        NSData *data2 = [content dataUsingEncoding:encoding allowLossyConversion:YES];
        NSLog(@"data2: %@", data2);
        
    } @catch (NSException *exception) {
        
        NSLog(@"exception: %@", exception);
        
    } @finally {
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
