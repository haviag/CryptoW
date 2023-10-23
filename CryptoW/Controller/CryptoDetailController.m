//
//  CryptoDetailController.m
//  CryptoW
//
//  Created by Harold Villacob on 20/10/23.
//

#import "CryptoDetailController.h"

@implementation CryptoDetailController

@synthesize cryptoDetailView;

- (instancetype)initWithCryptoCurrency:(CryptoCurrency *)cryptoCurrency {
    self = [super init];
    if (self) {
        _cryptoCurrency = cryptoCurrency;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorNamed:@"MyBackgoundColor"];
    cryptoDetailView = [[CryptoDetail alloc] init];
    cryptoDetailView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    [self.view addSubview:cryptoDetailView];
    
    [self configureDetailView:_cryptoCurrency];
}

-(void)configureDetailView: (CryptoCurrency *)cryptoCurrency {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *baseUrl = @"https://s2.coinmarketcap.com/static/img/coins/64x64/";
    NSString *imageName = [NSString stringWithFormat:@"%@.png", [NSString stringWithFormat:@"%d", [cryptoCurrency.idForImage intValue]]];
    [self loadCryptoImageFromURL:[baseUrl stringByAppendingString:imageName]];
    self.cryptoDetailView.nameLabel.text = cryptoCurrency.name;
    self.cryptoDetailView.symbolLabel.text = cryptoCurrency.symbol;
    self.cryptoDetailView.priceLabel.text = [formatter stringFromNumber:cryptoCurrency.price];
    self.cryptoDetailView.percentChangeLabel.text = [NSString stringWithFormat:@"%.2f%%", [cryptoCurrency.percentChange24h floatValue]];
    self.cryptoDetailView.circulateSupplyLabel.text = [formatter stringFromNumber:cryptoCurrency.circulatingSupply];
    if ([cryptoCurrency.maxSupply isKindOfClass:[NSNumber class]]) {
        double maxSupplyValue = [cryptoCurrency.maxSupply doubleValue];
        double circulatingSupplyValue = [cryptoCurrency.circulatingSupply doubleValue];
        double percentageOccupied = (circulatingSupplyValue / maxSupplyValue) * 100;
        self.cryptoDetailView.mySlider.value = percentageOccupied/100;
        self.cryptoDetailView.circulatingSupplyPercentageLabel.text = [NSString stringWithFormat:@"%.2f%%", percentageOccupied];
    } else {
        self.cryptoDetailView.mySlider.hidden = true;
        self.cryptoDetailView.circulatingSupplyPercentageLabel.hidden = true;
    }
}

- (void)loadCryptoImageFromURL:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    
    if (url) {
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (data && !error) {
                UIImage *image = [UIImage imageWithData:data];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.cryptoDetailView.cryptoImageView.image = image;
                    });
                }
            }
        }];
        
        [task resume];
    }
}

@end
