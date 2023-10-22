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
@property (strong, nonatomic) UILabel *circulateSupplyLabel;
@property (strong, nonatomic) UILabel *circulateSupplyTitleLabel;
@property (strong, nonatomic) UIImageView *cryptoImageView;
@property (strong, nonatomic) UIButton *squaredButton;
@property (strong, nonatomic) UIButton *trackInPortfolioButton;
@property (strong, nonatomic) UISlider *mySlider;
@property (strong, nonatomic) UILabel *circulatingSupplyPercentageLabel;
@property (strong, nonatomic) UILabel *aboutCoinTitleLabel;
@property (strong, nonatomic) UILabel *aboutCoinBodyLabel;


@property (strong, nonatomic) CryptoCurrency *cryptoCurrency;

- (instancetype)initWithCryptoCurrency:(CryptoCurrency *)cryptoCurrency;

@end
