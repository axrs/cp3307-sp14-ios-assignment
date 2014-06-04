//
// Created by Alexander Scott on 4/06/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASAudioEngine.h"

@implementation ASAudioEngine {
}


static ASAudioEngine *_sharedInstance = nil;

static dispatch_once_t predicate;

+ (id)sharedInstance {
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ASAudioEngine alloc] init];
    });
    return _sharedInstance;
}

- (AVAudioPlayer *)backgroundPlayer {
    if (_backgroundPlayer == nil) {
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"lobbyMusic" ofType:@"mp3"];
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

}

+ (void)playDeniedAudio {

}

+ (void)playTransitionAudio {

}


@end