//
//  UIView+CryptoDetail.m
//  CryptoW
//
//  Created by Harold Villacob on 23/10/23.
//

#import "CryptoDetail.h"

@implementation CryptoDetail

- (instancetype)init {
    self = [super init];
    if (self) {
        self.myDetailView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.myDetailView.backgroundColor = [UIColor colorNamed:@"MyBackgoundColor"];
        [self addSubview:self.myDetailView];

        self.cryptoImageView = [[UIImageView alloc] init];
        self.cryptoImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.cryptoImageView.clipsToBounds = YES;
        [self.myDetailView addSubview:self.cryptoImageView];

        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.font = [UIFont boldSystemFontOfSize:18.0];
        self.nameLabel.textColor = [UIColor whiteColor];
        [self.myDetailView addSubview:self.nameLabel];

        self.symbolLabel = [[UILabel alloc] init];
        self.symbolLabel.font = [UIFont systemFontOfSize:16.0];
        self.symbolLabel.textColor = [UIColor lightGrayColor];
        [self.myDetailView addSubview:self.symbolLabel];

        self.squaredButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.squaredButton.tintColor = [UIColor whiteColor];
        [self.squaredButton setImage:[UIImage systemImageNamed:@"square.and.arrow.up"] forState:UIControlStateNormal];
        [self.myDetailView addSubview:self.squaredButton];

        self.priceLabel = [[UILabel alloc] init];
        self.priceLabel.font = [UIFont boldSystemFontOfSize:36.0];
        self.priceLabel.textColor = [UIColor whiteColor];
        [self.myDetailView addSubview:self.priceLabel];

        self.percentChangeLabel = [[UILabel alloc] init];
        self.percentChangeLabel.font = [UIFont systemFontOfSize:18.0];
        self.percentChangeLabel.textColor = [UIColor whiteColor];
        [self.myDetailView addSubview:self.percentChangeLabel];

        self.trackInPortfolioButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.trackInPortfolioButton setTitle:@"Track in portfolio" forState:UIControlStateNormal];
        [self.trackInPortfolioButton setImage:[UIImage systemImageNamed:@"chart.pie"] forState:UIControlStateNormal];
        self.trackInPortfolioButton.tintColor = [UIColor whiteColor];
        self.trackInPortfolioButton.backgroundColor = [UIColor colorNamed:@"myButtonColor"];
        self.trackInPortfolioButton.layer.cornerRadius = 5;
        [self.myDetailView addSubview:self.trackInPortfolioButton];

        self.circulateSupplyTitleLabel = [[UILabel alloc] init];
        self.circulateSupplyTitleLabel.text = @"Circulating supply:";
        self.circulateSupplyTitleLabel.font = [UIFont systemFontOfSize:18];
        self.circulateSupplyTitleLabel.textColor = [UIColor whiteColor];
        [self.myDetailView addSubview:self.circulateSupplyTitleLabel];

        self.circulateSupplyLabel = [[UILabel alloc] init];
        self.circulateSupplyLabel.font = [UIFont systemFontOfSize:18];
        self.circulateSupplyLabel.textColor = [UIColor whiteColor];
        [self.myDetailView addSubview:self.circulateSupplyLabel];

        self.mySlider = [[UISlider alloc] init];
        self.mySlider.minimumValue = 0.0;
        self.mySlider.maximumValue = 1.0;
        self.mySlider.tintColor = [UIColor lightGrayColor];
        self.mySlider.userInteractionEnabled = false;
        [self.mySlider setThumbImage:[UIImage imageNamed:@"minusThumb"] forState:UIControlStateNormal];
        [self.myDetailView addSubview:self.mySlider];

        self.circulatingSupplyPercentageLabel = [[UILabel alloc] init];
        self.circulatingSupplyPercentageLabel.font = [UIFont systemFontOfSize:18.0];
        self.circulatingSupplyPercentageLabel.textColor = [UIColor whiteColor];
        [self.myDetailView addSubview:self.circulatingSupplyPercentageLabel];
        
        [self setupConstraints];
    }
    return self;
}

-(void)setupConstraints {
    self.myDetailView.translatesAutoresizingMaskIntoConstraints = NO;
    self.cryptoImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.symbolLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.squaredButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.priceLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.percentChangeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.trackInPortfolioButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.circulateSupplyLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.circulateSupplyTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.mySlider.translatesAutoresizingMaskIntoConstraints = NO;
    self.circulatingSupplyPercentageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.myDetailView.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor].active = YES;
    [self.myDetailView.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor].active = YES;
    [self.myDetailView.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor].active = YES;
    [self.myDetailView.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor].active = YES;
    
    [_cryptoImageView.heightAnchor constraintEqualToConstant:40].active = YES;
    [_cryptoImageView.widthAnchor constraintEqualToConstant:40].active = YES;
    
    [self.cryptoImageView.leadingAnchor constraintEqualToAnchor:self.myDetailView.leadingAnchor constant:16].active = YES;
    [self.cryptoImageView.topAnchor constraintEqualToAnchor:self.myDetailView.topAnchor constant:16].active = YES;
    
    [self.nameLabel.leadingAnchor constraintEqualToAnchor:self.cryptoImageView.trailingAnchor constant: 8].active = YES;
    [self.nameLabel.topAnchor constraintEqualToAnchor:self.myDetailView.topAnchor constant:24].active = YES;
    
    [self.symbolLabel.leadingAnchor constraintEqualToAnchor:self.nameLabel.trailingAnchor constant:8].active = YES;
    [self.symbolLabel.topAnchor constraintEqualToAnchor:self.myDetailView.topAnchor constant:26].active = YES;
    
    [self.squaredButton.trailingAnchor constraintEqualToAnchor:self.myDetailView.trailingAnchor constant:-16].active = YES;
    [self.squaredButton.topAnchor constraintEqualToAnchor:self.myDetailView.topAnchor constant:16].active = YES;
    [self.squaredButton.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.squaredButton.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.priceLabel.leadingAnchor constraintEqualToAnchor:self.myDetailView.leadingAnchor constant:16].active = YES;
    [self.priceLabel.topAnchor constraintEqualToAnchor:self.cryptoImageView.bottomAnchor constant:16].active = YES;
    
    [self.percentChangeLabel.trailingAnchor constraintEqualToAnchor:self.myDetailView.trailingAnchor constant:-16].active = YES;
    [self.percentChangeLabel.topAnchor constraintEqualToAnchor:self.cryptoImageView.bottomAnchor constant:16].active = YES;
    
    [self.trackInPortfolioButton.topAnchor constraintEqualToAnchor:self.priceLabel.bottomAnchor constant:32].active = YES;
    [self.trackInPortfolioButton.leadingAnchor constraintEqualToAnchor:self.myDetailView.leadingAnchor constant:16].active = YES;
    [self.trackInPortfolioButton.trailingAnchor constraintEqualToAnchor:self.myDetailView.trailingAnchor constant:-16].active = YES;
    [self.trackInPortfolioButton.heightAnchor constraintEqualToConstant:32].active = YES;
    
    [self.circulateSupplyTitleLabel.topAnchor constraintEqualToAnchor:self.trackInPortfolioButton.bottomAnchor constant:32].active = YES;
    [self.circulateSupplyTitleLabel.leadingAnchor constraintEqualToAnchor:self.myDetailView.leadingAnchor constant:16].active = YES;
    
    [self.circulateSupplyLabel.topAnchor constraintEqualToAnchor:self.trackInPortfolioButton.bottomAnchor constant:32].active = YES;
    [self.circulateSupplyLabel.trailingAnchor constraintEqualToAnchor:self.myDetailView.trailingAnchor constant:-16].active = YES;
    
    [self.mySlider.topAnchor constraintEqualToAnchor:self.circulateSupplyTitleLabel.bottomAnchor constant:32].active = YES;
    [self.mySlider.leadingAnchor constraintEqualToAnchor:self.myDetailView.leadingAnchor constant:16].active = YES;
    [self.mySlider.centerYAnchor constraintEqualToAnchor:self.circulatingSupplyPercentageLabel.centerYAnchor].active = YES;
    
    [self.circulatingSupplyPercentageLabel.topAnchor constraintEqualToAnchor:self.circulateSupplyTitleLabel.bottomAnchor constant:32].active = YES;
    [self.circulatingSupplyPercentageLabel.leadingAnchor constraintEqualToAnchor:self.mySlider.trailingAnchor constant:16].active = YES;
    [self.circulatingSupplyPercentageLabel.trailingAnchor constraintEqualToAnchor:self.myDetailView.trailingAnchor constant:-16].active = YES;
}
@end
