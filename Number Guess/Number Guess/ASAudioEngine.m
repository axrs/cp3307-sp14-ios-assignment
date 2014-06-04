//
// Created by Alexander Scott on 4/06/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASAudioEngine.h"

@implementation ASAudioEngine {
    SystemSoundID _confirmId;
    SystemSoundID _transitionId;
    SystemSoundID _backId;
}


static ASAudioEngine *_sharedInstance = nil;

static dispatch_once_t predicate;

+ (id)sharedInstance {
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ASAudioEngine alloc] init];
    });
    return _sharedInstance;
}


- (id)init {
    self = [super init];
    if (self) {

        //Init sound ids
        NSBundle *main = [NSBundle mainBundle];

        NSString *path = [main pathForResource:@"back" ofType:@"mp3"];
        CFURLRef ref = (__bridge CFURLRef) [NSURL fileURLWithPath:path];
        AudioServicesCreateSystemSoundID(ref, &_backId);

        path = [main pathForResource:@"confirm" ofType:@"mp3"];
        ref = (__bridge CFURLRef) [NSURL fileURLWithPath:path];
        AudioServicesCreateSystemSoundID(ref, &_confirmId);

        path = [main pathForResource:@"card_transition" ofType:@"mp3"];
        ref = (__bridge CFURLRef) [NSURL fileURLWithPath:path];
        AudioServicesCreateSystemSoundID(ref, &_transitionId);
    }
    return self;
}


- (AVAudioPlayer *)backgroundPlayer {
    if (_backgroundPlayer == nil) {
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"lobby" ofType:@"mp3"];
        NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath];
        _backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
        _backgroundPlayer.numberOfLoops = -1;
    }
    return _backgroundPlayer;
}

+ (void)startBackgroundAudio {
    [[[ASAudioEngine sharedInstance] backgroundPlayer] play];
}

+ (void)stopBackgroundAudio {
    [[[ASAudioEngine sharedInstance] backgroundPlayer] pause];
}

+ (void)playConfirmAudio {
    [[ASAudioEngine sharedInstance] playConfirmAudio];
}

+ (void)playBackAudio {
    [[ASAudioEngine sharedInstance] playBackAudio];
}

+ (void)playTransitionAudio {
    [[ASAudioEngine sharedInstance] playTransitionAudio];
}


- (void)playConfirmAudio {
    AudioServicesPlaySystemSound(_confirmId);
}

- (void)playBackAudio {
    AudioServicesPlaySystemSound(_backId);
}

- (void)playTransitionAudio {
    AudioServicesPlaySystemSound(_transitionId);
}


@end