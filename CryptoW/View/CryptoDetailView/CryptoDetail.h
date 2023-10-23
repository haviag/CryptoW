//
//  UIView+CryptoDetail.h
//  CryptoW
//
//  Created by Harold Villacob on 23/10/23.
//

#import <UIKit/UIKit.h>

@interface CryptoDetail : UIView

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

@end
