//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASBinaryGameSequenceCommand.h"
#import "ASSingleGameCore.h"
#import "ASBinaryGameKeyGenerator.h"

/** Binary Game Key Configuration Command

*/
@implementation ASBinaryGameSequenceCommand {

}


/**---------------------------------------------------------------------------------------
* @name execute
*  ---------------------------------------------------------------------------------------
*/

/** Executes the command configuring the game to use the Binary Game Key Generator

*/
- (void)execute {
    ASGameCore *instance = [ASSingleGameCore sharedInstance];
    ASBinaryGameKeyGenerator *generator = [[ASBinaryGameKeyGenerator alloc] init];

    [instance setKeyGenerator:generator];
}

@end