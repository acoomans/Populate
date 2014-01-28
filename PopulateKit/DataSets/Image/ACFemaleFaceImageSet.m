//
//  ACFemaleFaceImageSet.m
//  Populate
//
//  Created by Arnaud Coomans on 28/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACFemaleFaceImageSet.h"

@interface ACFemaleFaceImageSet ()
- (NSArray*)files;
@end

@implementation ACFemaleFaceImageSet

- (NSArray*)files {
    static NSArray *_files = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        NSString *directory = [[bundle pathForResource:@"PopulateKit" ofType:@"bundle"] stringByAppendingPathComponent:@"female"];
        _files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directory error:nil];
    });
    return _files;
}

- (UIImage*)randomImage {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *directory = [[bundle pathForResource:@"PopulateKit" ofType:@"bundle"] stringByAppendingPathComponent:@"female"];
    NSString *file = [directory stringByAppendingPathComponent:self.files[arc4random_uniform(self.files.count)]];
    return [UIImage imageWithContentsOfFile:file];
}

- (NSInteger)count {
    return [self.files count];
}

@end
