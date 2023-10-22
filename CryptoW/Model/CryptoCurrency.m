//
//  CryptoCurrency.m
//  CryptoW
//
//  Created by Harold Villacob on 19/10/23.
//

#import "CryptoCurrency.h"

@implementation CryptoCurrency

- (instancetype)initWithName:(NSString *)name symbol:(NSString *)symbol price:(NSNumber *)price percentChange24h:(NSNumber *)percentChange24h idForImage:(NSNumber *)idForImage circulatingSupply:(NSNumber *)circulatingSupply maxSupply:(NSNumber *)maxSupply {
    self = [super init];
    if (self) {
        _name = name;
        _symbol = symbol;
        _price = price;
        _percentChange24h = percentChange24h;
        _idForImage = idForImage;
        _circulatingSupply = circulatingSupply;
        _maxSupply = maxSupply;
    }
    return self;
}

@end
