//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface ASAudioEngine : NSObject

@property(nonatomic, retain) AVAudioPlayer *backgroundPlayer;


+ (id)sharedInstance;

- (id)init;

+ (void)startBackgroundAudio;

+ (void)pauseBackgroundAudio;

+ (void)playConfirmAudio;

- (void)playConfirmAudio;

+ (void)playBackAudio;

- (void)playBackAudio;

+ (void)playTransitionAudio;

- (void)playTransitionAudio;
@end