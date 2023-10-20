//
//  CryptoDataController.m
//  CryptoW
//
//  Created by Harold Villacob on 18/10/23.
//

#import "CryptoDataController.h"
#import "CryptoCurrency.h"

@implementation CryptoDataController

- (instancetype)init {
    self = [super init];
    if (self) {
        _cryptoCurrencies = [NSMutableArray array];
    }
    return self;
}

- (void)loadCryptoDataFromJSON {
    NSString *jsonFilePath = [[NSBundle mainBundle] pathForResource:@"cryptoData" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonFilePath];
    
    if (jsonData) {
        NSError *error;
        NSDictionary *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        
        if (jsonArray && !error) {
            [self.cryptoCurrencies removeAllObjects];
            NSDictionary *data = jsonArray[@"data"];
            NSArray *coins = data[@"coins"];
            
            if (coins) {
                for (NSDictionary *cryptoData in coins) {
                    NSString *name = cryptoData[@"name"];
                    NSString *symbol = cryptoData[@"symbol"];
                    NSNumber *idForImage = cryptoData[@"id"];
                    
                    NSDictionary *quoteData = cryptoData[@"quote"][@"USD"];
                    NSNumber *price = quoteData[@"price"];
                    NSNumber *percentChange24h = quoteData[@"percent_change_24h"];
                    
                    CryptoCurrency *cryptoCurrency = [[CryptoCurrency alloc] initWithName:name symbol:symbol price:price percentChange24h:percentChange24h idForImage:idForImage];
                    [self.cryptoCurrencies addObject:cryptoCurrency];
                }
            }
        }
    }
}

- (void)loadCryptoDataFromAPI {
    NSString *apiKey = @"7a6ab6a3-ee28-4074-89c7-5e08cbb640b5";
    NSString *urlString = [NSString stringWithFormat:@"https://pro-api.coinmarketcap.com/v1/cryptocurrency/category?id=605e2ce9d41eae1066535f7c&start=1&limit=20&convert=USD"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setValue:apiKey forHTTPHeaderField:@"X-CMC_PRO_API_KEY"];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error al realizar la solicitud: %@", error);
            return;
        }
        
        NSError *jsonError;
        NSDictionary *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
        
        if (jsonError) {
            NSLog(@"Error al analizar JSON: %@", jsonError);
            return;
        }
        
        [self.cryptoCurrencies removeAllObjects];
        
        NSDictionary *dataInJSON = jsonArray[@"data"];
        NSArray *coins = dataInJSON[@"coins"];
        
        if (coins) {
            for (NSDictionary *cryptoData in coins) {
                NSString *name = cryptoData[@"name"];
                NSString *symbol = cryptoData[@"symbol"];
                NSNumber *idForImage = cryptoData[@"id"];
                
                NSDictionary *quoteData = cryptoData[@"quote"][@"USD"];
                NSNumber *price = quoteData[@"price"];
                NSNumber *percentChange24h = quoteData[@"percent_change_24h"];
                
                CryptoCurrency *cryptoCurrency = [[CryptoCurrency alloc] initWithName:name symbol:symbol price:price percentChange24h:percentChange24h idForImage:idForImage];
                [self.cryptoCurrencies addObject:cryptoCurrency];
            }
        }
        
        if ([self.delegate respondsToSelector:@selector(cryptoDataDidUpdate)]) {
            [self.delegate cryptoDataDidUpdate];
        }
    }];
    
    [task resume];
}

@end
