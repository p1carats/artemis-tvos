//
//  TemporaryHost.h
//  Moonlight
//
//  Created by Cameron Gutman on 12/1/15.
//  Copyright © 2015 Moonlight Stream. All rights reserved.
//

#import "Utils.h"
#import "Host+CoreDataClass.h"

@interface TemporaryHost : NSObject

@property (atomic) State state;
@property (atomic) PairState pairState;
@property (atomic, nullable, strong) NSString * activeAddress;
@property (atomic, nullable, strong) NSString * currentGame;
@property (atomic) unsigned short httpsPort;
@property (atomic) BOOL isNvidiaServerSoftware;

@property (atomic, nullable, strong) NSData *serverCert;
@property (atomic, nullable, strong) NSString *address;
@property (atomic, nullable, strong) NSString *externalAddress;
@property (atomic, nullable, strong) NSString *localAddress;
@property (atomic, nullable, strong) NSString *ipv6Address;
@property (atomic, nullable, strong) NSString *mac;
@property (atomic)                   int serverCodecModeSupport;

NS_ASSUME_NONNULL_BEGIN

@property (atomic, strong) NSString *name;
@property (atomic, strong) NSString *uuid;
@property (atomic, strong) NSSet *appList;

- (id) initFromHost:(Host*)host;

- (NSComparisonResult)compareName:(TemporaryHost *)other;

- (void) propagateChangesToParent:(Host*)host;

NS_ASSUME_NONNULL_END

@end
