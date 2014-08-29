//
//   ______    ______    ______
//  /\  __ \  /\  ___\  /\  ___\
//  \ \  __<  \ \  __\_ \ \  __\_
//   \ \_____\ \ \_____\ \ \_____\
//    \/_____/  \/_____/  \/_____/
//
//  Powered by BeeFramework
//
//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___.h"

#pragma mark -

@implementation ___FILEBASENAMEASIDENTIFIER___

- (void)load
{
    [self loadCache];
}

- (void)unload
{
    [self saveCache];
}

- (NSString *)cacheKey
{
    // You should set an identified key if this model is shared.
    return NSStringFromClass([self class]);
}

- (void)loadCache
{
    NSData * data = bee.system.fileCache[self.cacheKey];
    if ( data )
    {
        [self.___VARIABLE_datasForResponAPI___ removeAllObjects];
        [self.___VARIABLE_datasForResponAPI___ addObjectsFromArray:[___VARIABLE_classForResponData___ objectsFromAny:data]];
    }
}

- (void)saveCache
{
    bee.system.fileCache[self.cacheKey] = [self.___VARIABLE_datasForResponAPI___ objectToData];
}

- (void)clearCache
{
    bee.system.fileCache[self.cacheKey] = nil;
    
    [self.___VARIABLE_datasForResponAPI___ removeAllObjects];
    
    self.loaded = NO;
}

#pragma mark -

- (void)firstPage
{
    [___VARIABLE_apiForModel___ cancel];
    
    ___VARIABLE_apiForModel___ * api = [___VARIABLE_apiForModel___ apiWithResponder:self];
    
    // config your pagination
    // api.req.paging.offset = @(0);
    // api.req.paging.limit = @(10);
    
    @weakify( api );
    
    api.whenUpdate = ^
    {
        @normalize( api );
        
        if ( api.sending )
        {
            [self sendUISignal:self.RELOADING];
        }
        else if ( api.succeed )
        {
            if ( ERROR_CODE_OK != api.resp.resultCode.intValue )
            {
                [self sendUISignal:self.RELOADED];
            }
            else
            {
                [self.___VARIABLE_datasForResponAPI___ removeAllObjects];
                [self.___VARIABLE_datasForResponAPI___ addObjectsFromArray:api.resp.___VARIABLE_datasForResponAPI___];
                
                // self.paged = api.resp.paged;
                self.loaded = YES;
                
                [self sendUISignal:self.RELOADED];
            }
        }
        else if ( api.failed )
        {
            [self sendUISignal:self.RELOADED];
        }
        //    else if ( api.cancelled )
        //    {
        //      [self sendUISignal:self.RELOADED];
        //    }
    };
    
    [api send];
}

- (void)nextPage
{
    [___VARIABLE_apiForModel___ cancel];
    
    ___VARIABLE_apiForModel___ * api =[___VARIABLE_apiForModel___ apiWithResponder:self];
    
    // api.req.paging.offset = @(self.___VARIABLE_datasForResponAPI___.count);
    // api.req.paging.limit = @(10);
    
    @weakify( api );
    
    api.whenUpdate = ^
    {
        @normalize( api );
        
        if ( api.sending )
        {
            [self sendUISignal:self.RELOADING];
        }
        else if ( api.succeed )
        {
//            if ( ERROR_CODE_OK != api.resp.resultCode.intValue )
//            {
//                [self sendUISignal:self.FAILED];
//            }
//            else
//            {
                [self.___VARIABLE_datasForResponAPI___ addObjectsFromArray:api.resp.___VARIABLE_datasForResponAPI___];
                
//                self.paged = api.resp.paged;
                self.loaded = (self.___VARIABLE_datasForResponAPI___.count) ? YES : NO;
                [self sendUISignal:self.RELOADED];
//            }
        }
        else if ( api.failed )
        {
            [self sendUISignal:self.FAILED];
        }
        else if ( api.cancelled )
        {
            [self sendUISignal:self.CANCELLED];
        }
    };
    
    [api send];
}

@end