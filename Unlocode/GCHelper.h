//
//  GCHelper.h
//  Unlocode
//
//  Created by SpidrWeb on 3/27/13.
//  Copyright (c) 2013 BrainGears Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>



@class GKLeaderboard, GKAchievement, GKPlayer;



@protocol GameCenterManagerDelegate <NSObject>
@optional
- (void) processGameCenterAuth: (NSError*) error;
- (void) scoreReported: (NSError*) error;
- (void) reloadScoresComplete: (GKLeaderboard*) leaderBoard error: (NSError*) error;
- (void) achievementSubmitted: (GKAchievement*) ach error:(NSError*) error;
- (void) achievementResetResult: (NSError*) error;
- (void) mappedPlayerIDToPlayer: (GKPlayer*) player error: (NSError*) error;
@end



@interface GCHelper : NSObject{
  //  BOOL gameCenterAvailable;
  //  BOOL userAuthenticated;
    
    
    NSMutableDictionary* earnedAchievementCache;
	
	//id <GameCenterManagerDelegate, NSObject> delegate;
}




//This property must be attomic to ensure that the cache is always in a viable state...
@property (retain) NSMutableDictionary* earnedAchievementCache;

@property (nonatomic, assign)  id <GameCenterManagerDelegate> delegate;

+ (BOOL) isGameCenterAvailable;

- (void) authenticateLocalUser;

- (void) reportScore: (int64_t) score forCategory: (NSString*) category;
- (void) reloadHighScoresForCategory: (NSString*) category;

- (void) submitAchievement: (NSString*) identifier percentComplete: (double) percentComplete;
- (void) resetAchievements;

- (void) mapPlayerIDtoPlayer: (NSString*) playerID;





//Leaderboard Category IDs
#define kLeaderboardID @"1"


//Achievement IDs
#define kAchievementOneTap @"1_Tap"
#define kAchievement20Taps @"20_Taps"
@end
