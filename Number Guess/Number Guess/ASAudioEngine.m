//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASAudioEngine.h"

/** Sound Effect and Background Audio controller

*/
@implementation ASAudioEngine {
    SystemSoundID _confirmId;
    SystemSoundID _transitionId;
    SystemSoundID _backId;
}


static ASAudioEngine *_sharedInstance = nil;

static dispatch_once_t predicate;


/**---------------------------------------------------------------------------------------
* @name sharedInstance
*  ---------------------------------------------------------------------------------------
*/

/** Gets the current instance of the AudioEngine

@return Shared AudioEngine instance
*/
+ (id)sharedInstance {
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ASAudioEngine alloc] init];
    });
    return _sharedInstance;
}


/**---------------------------------------------------------------------------------------
* @name init
*  ---------------------------------------------------------------------------------------
*/

/** Initialises the AudioEngine instance, loading all known sound effects and lobby music
in preparation to playing the sounds.

@return Initialised AudioEngine object
*/

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


/**---------------------------------------------------------------------------------------
* @name backgroundPlayer
*  ---------------------------------------------------------------------------------------
*/

/** Gets the current background AVAudioPlayer instance

@return Background Audio Player instance
*/
- (AVAudioPlayer *)backgroundPlayer {
    if (_backgroundPlayer == nil) {
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"lobby" ofType:@"mp3"];
        NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath];
        _backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
        _backgroundPlayer.numberOfLoops = -1;
    }
    return _backgroundPlayer;
}

/**---------------------------------------------------------------------------------------
* @name startBackgroundAudio
*  ---------------------------------------------------------------------------------------
*/

/** Starts and resumes the background audio player

*/
+ (void)startBackgroundAudio {
    [[[ASAudioEngine sharedInstance] backgroundPlayer] play];
}


/**---------------------------------------------------------------------------------------
* @name pauseBackgroundAudio
*  ---------------------------------------------------------------------------------------
*/

/** Pauses the background audio player

*/
+ (void)pauseBackgroundAudio {
    [[[ASAudioEngine sharedInstance] backgroundPlayer] pause];
}


/**---------------------------------------------------------------------------------------
* @name playConfirmAudio
*  ---------------------------------------------------------------------------------------
*/

/** Plays a action confirmed sound effect

*/
+ (void)playConfirmAudio {
    [[ASAudioEngine sharedInstance] playConfirmAudio];
}

/**---------------------------------------------------------------------------------------
* @name playBackAudio
*  ---------------------------------------------------------------------------------------
*/

/** Plays a reverse/back action sound effect

*/
+ (void)playBackAudio {
    [[ASAudioEngine sharedInstance] playBackAudio];
}

/**---------------------------------------------------------------------------------------
* @name playTransitionAudio
*  ---------------------------------------------------------------------------------------
*/

/** Plays a transition action sound effect

*/
+ (void)playTransitionAudio {
    [[ASAudioEngine sharedInstance] playTransitionAudio];
}

/**---------------------------------------------------------------------------------------
* @name playConfirmAudio
*  ---------------------------------------------------------------------------------------
*/

/** Plays a action confirmed sound effect

*/
- (void)playConfirmAudio {
    AudioServicesPlaySystemSound(_confirmId);
}

/**---------------------------------------------------------------------------------------
* @name playBackAudio
*  ---------------------------------------------------------------------------------------
*/

/** Plays a reverse/back action sound effect

*/
- (void)playBackAudio {
    AudioServicesPlaySystemSound(_backId);
}

/**---------------------------------------------------------------------------------------
* @name playTransitionAudio
*  ---------------------------------------------------------------------------------------
*/

/** Plays a transition action sound effect

*/
- (void)playTransitionAudio {
    AudioServicesPlaySystemSound(_transitionId);
}


@end