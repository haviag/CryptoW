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
        sectionStackView.spacing = 5;
        [self.contentView addSubview:sectionStackView];
        
        self.cryptoImageView = [[UIImageView alloc] init];
        [sectionStackView addArrangedSubview:self.cryptoImageView];
        self.cryptoImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.cryptoImageView.clipsToBounds = YES;
        [self loadCryptoImageFromURL:@"https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png"];
        
        self.priceAndPercentajeStackView = [[UIStackView alloc] init];
        self.priceAndPercentajeStackView.axis = UILayoutConstraintAxisVertical;
        self.priceAndPercentajeStackView.spacing = 5;
        
        self.nameAndSymbolStackView = [[UIStackView alloc] init];
        self.nameAndSymbolStackView.axis = UILayoutConstraintAxisVertical;
        self.nameAndSymbolStackView.spacing = 5;
        
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.font = [UIFont boldSystemFontOfSize:18.0];
        [_nameAndSymbolStackView addArrangedSubview:self.nameLabel];
        
        self.symbolLabel = [[UILabel alloc] init];
        self.symbolLabel.font = [UIFont systemFontOfSize:14.0];
        [_nameAndSymbolStackView addArrangedSubview:self.symbolLabel];
        
        self.priceLabel = [[UILabel alloc] init];
        self.priceLabel.font = [UIFont systemFontOfSize:14.0];
        [_priceAndPercentajeStackView addArrangedSubview:self.priceLabel];
        
        self.percentChangeLabel = [[UILabel alloc] init];
        self.percentChangeLabel.font = [UIFont systemFontOfSize:14.0];
        self.percentChangeLabel.textAlignment = NSTextAlignmentRight;
        [_priceAndPercentajeStackView addArrangedSubview:self.percentChangeLabel];
        
        [sectionStackView addArrangedSubview:self.nameAndSymbolStackView];
        [sectionStackView addArrangedSubview:self.priceAndPercentajeStackView];
        
        sectionStackView.translatesAutoresizingMaskIntoConstraints = NO;
        [sectionStackView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
        [sectionStackView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
        [sectionStackView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10].active = YES;
        [sectionStackView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10].active = YES;
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

@end
