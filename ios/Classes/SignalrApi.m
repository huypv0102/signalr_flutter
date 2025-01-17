// Autogenerated from Pigeon (v4.2.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "SignalrApi.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ?: [NSNull null]),
        @"message": (error.message ?: [NSNull null]),
        @"details": (error.details ?: [NSNull null]),
        };
  }
  return @{
      @"result": (result ?: [NSNull null]),
      @"error": errorDict,
      };
}
static id GetNullableObject(NSDictionary* dict, id key) {
  id result = dict[key];
  return (result == [NSNull null]) ? nil : result;
}
static id GetNullableObjectAtIndex(NSArray* array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}


@interface FLTConnectionOptions ()
+ (FLTConnectionOptions *)fromMap:(NSDictionary *)dict;
+ (nullable FLTConnectionOptions *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface FLTStatusChangeResult ()
+ (FLTStatusChangeResult *)fromMap:(NSDictionary *)dict;
+ (nullable FLTStatusChangeResult *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation FLTConnectionOptions
+ (instancetype)makeWithBaseUrl:(nullable NSString *)baseUrl
    hubName:(nullable NSString *)hubName
    queryString:(nullable NSString *)queryString
    hubMethods:(nullable NSArray<NSString *> *)hubMethods
    headers:(nullable NSDictionary<NSString *, NSString *> *)headers
    transport:(FLTTransport)transport {
  FLTConnectionOptions* pigeonResult = [[FLTConnectionOptions alloc] init];
  pigeonResult.baseUrl = baseUrl;
  pigeonResult.hubName = hubName;
  pigeonResult.queryString = queryString;
  pigeonResult.hubMethods = hubMethods;
  pigeonResult.headers = headers;
  pigeonResult.transport = transport;
  return pigeonResult;
}
+ (FLTConnectionOptions *)fromMap:(NSDictionary *)dict {
  FLTConnectionOptions *pigeonResult = [[FLTConnectionOptions alloc] init];
  pigeonResult.baseUrl = GetNullableObject(dict, @"baseUrl");
  pigeonResult.hubName = GetNullableObject(dict, @"hubName");
  pigeonResult.queryString = GetNullableObject(dict, @"queryString");
  pigeonResult.hubMethods = GetNullableObject(dict, @"hubMethods");
  pigeonResult.headers = GetNullableObject(dict, @"headers");
  pigeonResult.transport = [GetNullableObject(dict, @"transport") integerValue];
  return pigeonResult;
}
+ (nullable FLTConnectionOptions *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [FLTConnectionOptions fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"baseUrl" : (self.baseUrl ?: [NSNull null]),
    @"hubName" : (self.hubName ?: [NSNull null]),
    @"queryString" : (self.queryString ?: [NSNull null]),
    @"hubMethods" : (self.hubMethods ?: [NSNull null]),
    @"headers" : (self.headers ?: [NSNull null]),
    @"transport" : @(self.transport),
  };
}
@end

@implementation FLTStatusChangeResult
+ (instancetype)makeWithConnectionId:(nullable NSString *)connectionId
    status:(FLTConnectionStatus)status
    errorMessage:(nullable NSString *)errorMessage {
  FLTStatusChangeResult* pigeonResult = [[FLTStatusChangeResult alloc] init];
  pigeonResult.connectionId = connectionId;
  pigeonResult.status = status;
  pigeonResult.errorMessage = errorMessage;
  return pigeonResult;
}
+ (FLTStatusChangeResult *)fromMap:(NSDictionary *)dict {
  FLTStatusChangeResult *pigeonResult = [[FLTStatusChangeResult alloc] init];
  pigeonResult.connectionId = GetNullableObject(dict, @"connectionId");
  pigeonResult.status = [GetNullableObject(dict, @"status") integerValue];
  pigeonResult.errorMessage = GetNullableObject(dict, @"errorMessage");
  return pigeonResult;
}
+ (nullable FLTStatusChangeResult *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [FLTStatusChangeResult fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"connectionId" : (self.connectionId ?: [NSNull null]),
    @"status" : @(self.status),
    @"errorMessage" : (self.errorMessage ?: [NSNull null]),
  };
}
@end

@interface FLTSignalRHostApiCodecReader : FlutterStandardReader
@end
@implementation FLTSignalRHostApiCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [FLTConnectionOptions fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface FLTSignalRHostApiCodecWriter : FlutterStandardWriter
@end
@implementation FLTSignalRHostApiCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[FLTConnectionOptions class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface FLTSignalRHostApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FLTSignalRHostApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FLTSignalRHostApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FLTSignalRHostApiCodecReader alloc] initWithData:data];
}
@end


NSObject<FlutterMessageCodec> *FLTSignalRHostApiGetCodec() {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    FLTSignalRHostApiCodecReaderWriter *readerWriter = [[FLTSignalRHostApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void FLTSignalRHostApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FLTSignalRHostApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.SignalRHostApi.connect"
        binaryMessenger:binaryMessenger
        codec:FLTSignalRHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(connectConnectionOptions:completion:)], @"FLTSignalRHostApi api (%@) doesn't respond to @selector(connectConnectionOptions:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FLTConnectionOptions *arg_connectionOptions = GetNullableObjectAtIndex(args, 0);
        [api connectConnectionOptions:arg_connectionOptions completion:^(NSString *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.SignalRHostApi.reconnect"
        binaryMessenger:binaryMessenger
        codec:FLTSignalRHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(reconnectWithCompletion:)], @"FLTSignalRHostApi api (%@) doesn't respond to @selector(reconnectWithCompletion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api reconnectWithCompletion:^(NSString *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.SignalRHostApi.stop"
        binaryMessenger:binaryMessenger
        codec:FLTSignalRHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(stopWithCompletion:)], @"FLTSignalRHostApi api (%@) doesn't respond to @selector(stopWithCompletion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api stopWithCompletion:^(FlutterError *_Nullable error) {
          callback(wrapResult(nil, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.SignalRHostApi.isConnected"
        binaryMessenger:binaryMessenger
        codec:FLTSignalRHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(isConnectedWithCompletion:)], @"FLTSignalRHostApi api (%@) doesn't respond to @selector(isConnectedWithCompletion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api isConnectedWithCompletion:^(NSNumber *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.SignalRHostApi.invokeMethod"
        binaryMessenger:binaryMessenger
        codec:FLTSignalRHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(invokeMethodMethodName:arguments:completion:)], @"FLTSignalRHostApi api (%@) doesn't respond to @selector(invokeMethodMethodName:arguments:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_methodName = GetNullableObjectAtIndex(args, 0);
        NSArray<NSString *> *arg_arguments = GetNullableObjectAtIndex(args, 1);
        [api invokeMethodMethodName:arg_methodName arguments:arg_arguments completion:^(NSString *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface FLTSignalRPlatformApiCodecReader : FlutterStandardReader
@end
@implementation FLTSignalRPlatformApiCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [FLTStatusChangeResult fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface FLTSignalRPlatformApiCodecWriter : FlutterStandardWriter
@end
@implementation FLTSignalRPlatformApiCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[FLTStatusChangeResult class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface FLTSignalRPlatformApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FLTSignalRPlatformApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FLTSignalRPlatformApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FLTSignalRPlatformApiCodecReader alloc] initWithData:data];
}
@end


NSObject<FlutterMessageCodec> *FLTSignalRPlatformApiGetCodec() {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    FLTSignalRPlatformApiCodecReaderWriter *readerWriter = [[FLTSignalRPlatformApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

@interface FLTSignalRPlatformApi ()
@property (nonatomic, strong) NSObject<FlutterBinaryMessenger> *binaryMessenger;
@end

@implementation FLTSignalRPlatformApi

- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
  self = [super init];
  if (self) {
    _binaryMessenger = binaryMessenger;
  }
  return self;
}
- (void)onStatusChangeStatusChangeResult:(FLTStatusChangeResult *)arg_statusChangeResult completion:(void(^)(NSError *_Nullable))completion {
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.SignalRPlatformApi.onStatusChange"
      binaryMessenger:self.binaryMessenger
      codec:FLTSignalRPlatformApiGetCodec()      ];  [channel sendMessage:@[arg_statusChangeResult ?: [NSNull null]] reply:^(id reply) {
    completion(nil);
  }];
}
- (void)onNewMessageHubName:(NSString *)arg_hubName message:(NSObject *)arg_message completion:(void(^)(NSError *_Nullable))completion {
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.SignalRPlatformApi.onNewMessage"
      binaryMessenger:self.binaryMessenger
      codec:FLTSignalRPlatformApiGetCodec()      ];  [channel sendMessage:@[arg_hubName ?: [NSNull null], arg_message ?: [NSNull null]] reply:^(id reply) {
    completion(nil);
  }];
}
@end
