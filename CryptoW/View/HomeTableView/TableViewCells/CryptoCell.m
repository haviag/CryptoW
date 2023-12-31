//
//  CryptoCell.m
//  CryptoW
//
//  Created by Harold Villacob on 18/10/23.
//

#import "CryptoCell.h"

@implementation CryptoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor colorNamed:@"MyBackgoundColor"];
        
        self.cryptoImageView = [[UIImageView alloc] init];
        self.cryptoImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [_cryptoImageView.heightAnchor constraintEqualToConstant:25].active = YES;
        [_cryptoImageView.widthAnchor constraintEqualToConstant:25].active = YES;
        
        self.cryptoImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.cryptoImageView.clipsToBounds = YES;
        
        self.priceAndPercentajeStackView = [[UIStackView alloc] init];
        self.priceAndPercentajeStackView.axis = UILayoutConstraintAxisVertical;
        self.priceAndPercentajeStackView.distribution = UIStackViewDistributionFillEqually;
        self.priceAndPercentajeStackView.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.nameAndSymbolStackView = [[UIStackView alloc] init];
        self.nameAndSymbolStackView.axis = UILayoutConstraintAxisVertical;
        self.nameAndSymbolStackView.alignment = UIStackViewAlignmentTop;
        self.nameAndSymbolStackView.distribution = UIStackViewDistributionFillEqually;
        self.nameAndSymbolStackView.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.font = [UIFont boldSystemFontOfSize:18.0];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.numberOfLines = 0;
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        
        self.symbolLabel = [[UILabel alloc] init];
        self.symbolLabel.font = [UIFont systemFontOfSize:14.0];
        self.symbolLabel.textColor = [UIColor grayColor];
        self.symbolLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        
        self.priceLabel = [[UILabel alloc] init];
        self.priceLabel.font = [UIFont boldSystemFontOfSize:24.0];
        self.priceLabel.textAlignment = NSTextAlignmentRight;
        self.priceLabel.textColor = [UIColor whiteColor];
        self.priceLabel.numberOfLines = 0;
        self.priceLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        
        self.percentChangeLabel = [[UILabel alloc] init];
        self.percentChangeLabel.font = [UIFont systemFontOfSize:14.0];
        self.percentChangeLabel.textAlignment = NSTextAlignmentRight;
        self.percentChangeLabel.textColor = [UIColor whiteColor];
        self.percentChangeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self setupConstraints];
        
    }
    return self;
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

-(void)setupConstraints {
    UIStackView *sectionStackView = [[UIStackView alloc] init];
    UIView *dummyView = [[UIView alloc] init];
    UIView *cellBackgroundView = [[UIView alloc] init];
    
    cellBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    sectionStackView.translatesAutoresizingMaskIntoConstraints = NO;
    self.cryptoImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    sectionStackView.axis = UILayoutConstraintAxisHorizontal;
    sectionStackView.spacing = 16;
    sectionStackView.distribution = UIStackViewDistributionFillProportionally;
    
    cellBackgroundView.backgroundColor = [UIColor colorNamed:@"myPrimaryBgColor"];
    cellBackgroundView.layer.cornerRadius = 10;
    
    [cellBackgroundView addSubview:sectionStackView];
    [self.contentView addSubview:cellBackgroundView];
    [self.contentView addSubview:self.cryptoImageView];
    
//    [self.contentView addSubview:sectionStackView];
//    [sectionStackView addArrangedSubview:self.cryptoImageView];
    [_nameAndSymbolStackView addArrangedSubview:self.nameLabel];
    [_nameAndSymbolStackView addArrangedSubview:self.symbolLabel];
    [_priceAndPercentajeStackView addArrangedSubview:self.priceLabel];
    [_priceAndPercentajeStackView addArrangedSubview:self.percentChangeLabel];
    [sectionStackView addArrangedSubview:self.nameAndSymbolStackView];
    [sectionStackView addArrangedSubview:self.priceAndPercentajeStackView];
    [sectionStackView addArrangedSubview:dummyView];
    
    
    [cellBackgroundView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:16].active = YES;
    [cellBackgroundView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-16].active = YES;
    [cellBackgroundView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10].active = YES;
    [cellBackgroundView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-20].active = YES;
    
    [sectionStackView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:16].active = YES;
    [sectionStackView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-16].active = YES;
    [sectionStackView.topAnchor constraintEqualToAnchor:self.cryptoImageView.bottomAnchor constant:8].active = YES;
    [sectionStackView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-20].active = YES;
    [_nameAndSymbolStackView.leadingAnchor constraintEqualToAnchor:sectionStackView.leadingAnchor constant:16].active = YES;
    [sectionStackView.heightAnchor constraintEqualToConstant:72].active = YES;
    
    [self.cryptoImageView.leadingAnchor constraintEqualToAnchor:sectionStackView.leadingAnchor constant:16].active = YES;
    [self.cryptoImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
}

-(void)configureCell:(NSString *)name symbol:(NSString *)symbol price:(NSString *)price percentChange:(NSString *)percentChange imageUrl:(NSString *)imageUrl {
    self.nameLabel.text = name;
    self.symbolLabel.text = symbol;
    self.priceLabel.text = price;
    self.percentChangeLabel.text = percentChange;
    NSString *baseUrl = @"https://s2.coinmarketcap.com/static/img/coins/64x64/";
    NSString *imageName = [NSString stringWithFormat:@"%@.png", imageUrl];
    [self loadCryptoImageFromURL:[baseUrl stringByAppendingString:imageName]];
}

@end
