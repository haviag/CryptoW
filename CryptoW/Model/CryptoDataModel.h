//
//  CryptoDataController.h
//  CryptoW
//
//  Created by Harold Villacob on 18/10/23.
//

#import <Foundation/Foundation.h>

@protocol CryptoDataControllerDelegate <NSObject>
- (void)cryptoDataDidUpdate;
@end

@interface CryptoDataModel : NSObject

@property (nonatomic, strong) NSMutableArray *cryptoCurrencies;
@property (nonatomic, weak) id<CryptoDataControllerDelegate> delegate;

- (void)loadCryptoDataFromJSON;
- (void)loadCryptoDataFromAPI;

@end
