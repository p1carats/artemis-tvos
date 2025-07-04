//
//  TemporarySettings.m
//  Moonlight
//
//  Created by Cameron Gutman on 12/1/15.
//  Copyright © 2015 Moonlight Stream. All rights reserved.
//

#import "TemporarySettings.h"

@implementation TemporarySettings

- (id) initFromSettings:(Settings*)settings {
    self = [self init];
    
    self.parent = settings;
    
    // Apply default values from our Root.plist
    NSString* settingsBundle = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"bundle"];
    NSDictionary* settingsData = [NSDictionary dictionaryWithContentsOfFile:[settingsBundle stringByAppendingPathComponent:@"Root.plist"]];
    NSArray* preferences = [settingsData objectForKey:@"PreferenceSpecifiers"];
    NSMutableDictionary* defaultsToRegister = [[NSMutableDictionary alloc] initWithCapacity:[preferences count]];
    for (NSDictionary* prefSpecification in preferences) {
        NSString* key = [prefSpecification objectForKey:@"Key"];
        if (key != nil) {
            [defaultsToRegister setObject:[prefSpecification objectForKey:@"DefaultValue"] forKey:key];
        }
    }
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultsToRegister];
    
    self.bitrate = [NSNumber numberWithInteger:[[NSUserDefaults standardUserDefaults] integerForKey:@"bitrate"]];
    assert([self.bitrate intValue] != 0);
    self.framerate = [NSNumber numberWithInteger:[[NSUserDefaults standardUserDefaults] integerForKey:@"framerate"]];
    assert([self.framerate intValue] != 0);
    self.audioConfig = [NSNumber numberWithInteger:[[NSUserDefaults standardUserDefaults] integerForKey:@"audioConfig"]];
    assert([self.audioConfig intValue] != 0);
    self.preferredCodec = (typeof(self.preferredCodec))[[NSUserDefaults standardUserDefaults] integerForKey:@"preferredCodec"];
    self.useFramePacing = [[NSUserDefaults standardUserDefaults] integerForKey:@"useFramePacing"] != 0;
    self.playAudioOnPC = [[NSUserDefaults standardUserDefaults] boolForKey:@"audioOnPC"];
    self.enableHdr = [[NSUserDefaults standardUserDefaults] boolForKey:@"enableHdr"];
    self.optimizeGames = [[NSUserDefaults standardUserDefaults] boolForKey:@"optimizeGames"];
    self.multiController = [[NSUserDefaults standardUserDefaults] boolForKey:@"multipleControllers"];
    self.swapABXYButtons = [[NSUserDefaults standardUserDefaults] boolForKey:@"swapABXYButtons"];
    self.btMouseSupport = [[NSUserDefaults standardUserDefaults] boolForKey:@"btMouseSupport"];
    self.statsOverlay = [[NSUserDefaults standardUserDefaults] boolForKey:@"statsOverlay"];
    
    NSInteger _screenSize = [[NSUserDefaults standardUserDefaults] integerForKey:@"streamResolution"];
    switch (_screenSize) {
        case 0:
            self.height = [NSNumber numberWithInteger:720];
            self.width = [NSNumber numberWithInteger:1280];
            break;
        case 1:
            self.height = [NSNumber numberWithInteger:1080];
            self.width = [NSNumber numberWithInteger:1920];
            break;
        case 2:
            self.height = [NSNumber numberWithInteger:2160];
            self.width = [NSNumber numberWithInteger:3840];
            break;
        case 3:
            self.height = [NSNumber numberWithInteger:1440];
            self.width = [NSNumber numberWithInteger:2560];
            break;
        default:
            abort();
    }
    self.uniqueId = settings.uniqueId;
    
    return self;
}

@end
