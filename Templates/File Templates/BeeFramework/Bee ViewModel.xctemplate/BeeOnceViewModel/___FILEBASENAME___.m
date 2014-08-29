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
}

- (void)unload
{
}

#pragma mark -

- (void)reload
{
    [___VARIABLE_apiForModel___ cancel];
    
    ___VARIABLE_apiForModel___ * api = [___VARIABLE_apiForModel___ apiWithResponder:self];
    
    // TODO: config your req
    
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
//                // TODO: handle resp
            
                self.loaded = YES;
                [self sendUISignal:self.RELOADED];
//            }
        }
        else if ( api.failed )
        {
            [self sendUISignal:self.FAILED];
        }
        else if ( api.cancelled )
        {
            [self sendUISignal:self.RELOADED];
        }
    };
    
    [api send];
}

@end