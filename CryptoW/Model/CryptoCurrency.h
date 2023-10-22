//
//  CryptoCurrency.h
//  CryptoW
//
//  Created by Harold Villacob on 19/10/23.
//

#import <Foundation/Foundation.h>

@interface CryptoCurrency : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSNumber *percentChange24h;
@property (nonatomic, strong) NSNumber *idForImage;
@property (nonatomic, strong) NSNumber *circulatingSupply;
@property (nonatomic, strong) NSNumber *maxSupply;

- (instancetype)initWithName:(NSString *)name symbol:(NSString *)symbol price:(NSNumber *)price percentChange24h:(NSNumber *)percentChange24h idForImage:(NSNumber *)idForImage circulatingSupply:(NSNumber *)circulatingSupply maxSupply:(NSNumber *)maxSupply;

@end
