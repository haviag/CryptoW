//
//  CryptoDetailController.m
//  CryptoW
//
//  Created by Harold Villacob on 20/10/23.
//

#import "CryptoDetailController.h"

@implementation CryptoDetailController

- (instancetype)initWithCryptoCurrency:(CryptoCurrency *)cryptoCurrency {
    self = [super init];
    if (self) {
        _cryptoCurrency = cryptoCurrency;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myDetailView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    [self.view addSubview:self.myDetailView];
    
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
    self.trackInPortfolioButton.backgroundColor = [UIColor lightGrayColor];
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
    
    [self configureDetailView:_cryptoCurrency];
    [self setupConstraints];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        self.myDetailView.frame = CGRectMake(0, 0, size.width, size.height);
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self.myDetailView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    }];
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
    
    [self.myDetailView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [self.myDetailView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
    [self.myDetailView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = YES;
    [self.myDetailView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = YES;
    
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
//    [self.trackInPortfolioButton.titleLabel.leadingAnchor constraintEqualToAnchor:self.trackInPortfolioButton.leadingAnchor constant:32].active = YES;
    [self.trackInPortfolioButton.heightAnchor constraintEqualToConstant:32].active = YES;
    
    [self.circulateSupplyTitleLabel.topAnchor constraintEqualToAnchor:self.trackInPortfolioButton.bottomAnchor constant:32].active = YES;
    [self.circulateSupplyTitleLabel.leadingAnchor constraintEqualToAnchor:self.myDetailView.leadingAnchor constant:16].active = YES;
    
    [self.circulateSupplyLabel.topAnchor constraintEqualToAnchor:self.trackInPortfolioButton.bottomAnchor constant:32].active = YES;
    [self.circulateSupplyLabel.trailingAnchor constraintEqualToAnchor:self.myDetailView.trailingAnchor constant:-16].active = YES;
}

-(void)configureDetailView: (CryptoCurrency *)cryptoCurrency {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *baseUrl = @"https://s2.coinmarketcap.com/static/img/coins/64x64/";
    NSString *imageName = [NSString stringWithFormat:@"%@.png", [NSString stringWithFormat:@"%d", [cryptoCurrency.idForImage intValue]]];
    [self loadCryptoImageFromURL:[baseUrl stringByAppendingString:imageName]];
    self.nameLabel.text = cryptoCurrency.name;
    self.symbolLabel.text = cryptoCurrency.symbol;
    self.priceLabel.text = [formatter stringFromNumber:cryptoCurrency.price];
    self.percentChangeLabel.text = [NSString stringWithFormat:@"%.2f%%", [cryptoCurrency.percentChange24h floatValue]];
    
    self.circulateSupplyLabel.text = [formatter stringFromNumber:cryptoCurrency.circulatingSupply];
}

- (void)loadCryptoImageFromURL:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    
    if (url) {
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (data && !error) {
                UIImage *image = [UIImage imageWithData:data];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.cryptoImageView.image = image;
                    });
                }
            }
        }];
        
        [task resume];
    }
}

@end
