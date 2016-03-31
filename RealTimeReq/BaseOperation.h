
#import <Foundation/Foundation.h>

#define domainService  API_URL
// Thont5
static NSString *const urlAPI = API_URL;

typedef void (^FinishBlock)(NSData *result, NSURLResponse *response);
typedef void (^ErrorBlock)(NSError *error);

@interface BaseOperation : NSObject
{
    NSString *uri;
    NSURLConnection *conn;
    NSURLRequest *request;
    NSURLResponse *response;
    NSMutableData *result;
    ErrorBlock errorHandler;
    FinishBlock completionHandler;
}

@property (nonatomic, retain) NSString *uri;
@property (nonatomic, retain) NSMutableData *result;
@property (nonatomic, retain) NSURLRequest *request;
@property (nonatomic, retain) NSURLResponse *response;
@property (nonatomic, retain) NSURLConnection *conn;
@property (nonatomic, copy) ErrorBlock errorHandler;
@property (nonatomic, copy) FinishBlock completionHandler;

- (void)start;
- (void)cancel;

@end
