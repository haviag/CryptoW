//
//  CryptoDetailController.h
//  CryptoW
//
//  Created by Harold Villacob on 20/10/23.
//

#import <UIKit/UIKit.h>
#import "CryptoCurrency.h"
#import "CryptoDetail.h"


@interface CryptoDetailController : UIViewController

@property (strong, nonatomic) CryptoCurrency *cryptoCurrency;
@property (strong, nonatomic) CryptoDetail *cryptoDetailView;
- (instancetype)initWithCryptoCurrency:(CryptoCurrency *)cryptoCurrency;

@end
