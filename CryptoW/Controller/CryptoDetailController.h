//
//  CryptoDetailController.h
//  CryptoW
//
//  Created by Harold Villacob on 20/10/23.
//

#import <UIKit/UIKit.h>
#import "CryptoCurrency.h"


@interface CryptoDetailController : UIViewController

@property (strong, nonatomic) UIView *myDetailView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *percentChangeLabel;
@property (strong, nonatomic) UILabel *symbolLabel;
@property (strong, nonatomic) UIImageView *cryptoImageView;
@property (strong, nonatomic) UIButton *squaredButton;
@property (strong, nonatomic) UIButton *trackInPortfolioButton;


@property (strong, nonatomic) CryptoCurrency *cryptoCurrency;

- (instancetype)initWithCryptoCurrency:(CryptoCurrency *)cryptoCurrency;

@end
