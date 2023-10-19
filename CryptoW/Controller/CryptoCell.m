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
        UIStackView *sectionStackView = [[UIStackView alloc] init];
        sectionStackView.axis = UILayoutConstraintAxisHorizontal;
        sectionStackView.spacing = 16;
        sectionStackView.distribution = UIStackViewDistributionFillProportionally;
        sectionStackView.backgroundColor = UIColor.grayColor;
        sectionStackView.layer.cornerRadius = 10;
        [self.contentView addSubview:sectionStackView];
        
        UIView *dummyView = [[UIView alloc] init];
        
        self.cryptoImageView = [[UIImageView alloc] init];
        self.cryptoImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [_cryptoImageView.heightAnchor constraintEqualToConstant:56].active = YES;
        [_cryptoImageView.widthAnchor constraintEqualToConstant:56].active = YES;
        [sectionStackView addArrangedSubview:self.cryptoImageView];
        self.cryptoImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.cryptoImageView.clipsToBounds = YES;
//        self.cryptoImageView.backgroundColor = UIColor.whiteColor;
        [self loadCryptoImageFromURL:@"https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png"];
        
        self.priceAndPercentajeStackView = [[UIStackView alloc] init];
        self.priceAndPercentajeStackView.axis = UILayoutConstraintAxisVertical;
        self.priceAndPercentajeStackView.spacing = 5;
        self.priceAndPercentajeStackView.distribution = UIStackViewDistributionFillEqually;
//        self.priceAndPercentajeStackView.backgroundColor = UIColor.redColor;
        self.priceAndPercentajeStackView.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.nameAndSymbolStackView = [[UIStackView alloc] init];
        self.nameAndSymbolStackView.axis = UILayoutConstraintAxisVertical;
        self.nameAndSymbolStackView.spacing = 2;
        self.nameAndSymbolStackView.alignment = UIStackViewAlignmentTop;
        self.nameAndSymbolStackView.distribution = UIStackViewDistributionFillEqually;
//        self.nameAndSymbolStackView.backgroundColor = UIColor.greenColor;
        self.nameAndSymbolStackView.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.font = [UIFont boldSystemFontOfSize:14.0];
//        self.nameLabel.backgroundColor = UIColor.orangeColor;
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_nameAndSymbolStackView addArrangedSubview:self.nameLabel];
        
        self.symbolLabel = [[UILabel alloc] init];
        self.symbolLabel.font = [UIFont systemFontOfSize:10.0];
//        self.symbolLabel.backgroundColor = UIColor.yellowColor;
        self.symbolLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_nameAndSymbolStackView addArrangedSubview:self.symbolLabel];
        
        self.priceLabel = [[UILabel alloc] init];
        self.priceLabel.font = [UIFont boldSystemFontOfSize:18.0];
        self.priceLabel.textAlignment = NSTextAlignmentRight;
        self.priceLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_priceAndPercentajeStackView addArrangedSubview:self.priceLabel];
        
        self.percentChangeLabel = [[UILabel alloc] init];
        self.percentChangeLabel.font = [UIFont systemFontOfSize:10.0];
        self.percentChangeLabel.textAlignment = NSTextAlignmentRight;
        self.percentChangeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_priceAndPercentajeStackView addArrangedSubview:self.percentChangeLabel];
        
        [sectionStackView addArrangedSubview:self.nameAndSymbolStackView];
        [sectionStackView addArrangedSubview:self.priceAndPercentajeStackView];
        [sectionStackView addArrangedSubview:dummyView];
        
        sectionStackView.translatesAutoresizingMaskIntoConstraints = NO;
        [sectionStackView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:16].active = YES;
        [sectionStackView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-16].active = YES;
        [sectionStackView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10].active = YES;
        [sectionStackView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10].active = YES;
        [_cryptoImageView.leadingAnchor constraintEqualToAnchor:sectionStackView.leadingAnchor constant:16].active = YES;
        [sectionStackView.heightAnchor constraintEqualToConstant:72].active = YES;
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
                    // Actualiza el UIImageView en el hilo principal
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.cryptoImageView.image = image;
                    });
                }
            }
        }];
        
        [task resume];
    }
}

-(void)configureCell:(NSString *)name symbol:(NSString *)symbol price:(NSString *)price percentChange:(NSString *)percentChange imageUrl:(NSString *)imageUrl {
    self.nameLabel.text = name;
    self.symbolLabel.text = symbol;
    self.priceLabel.text = price;
    self.percentChangeLabel.text = percentChange;
}

@end
