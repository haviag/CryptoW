//
//  UIView+LandingView.m
//  CryptoW
//
//  Created by Harold Villacob on 23/10/23.
//

#import "LandingView.h"

@implementation LandingView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.myView.backgroundColor = [UIColor colorNamed:@"MyBackgoundColor"];
        [self addSubview:self.myView];
        
        self.welcomeLabel = [[UILabel alloc] init];
        self.welcomeLabel.text = @"Welcome to CryptoWallet!";
        self.welcomeLabel.textColor = [UIColor whiteColor];
        self.welcomeLabel.font = [UIFont boldSystemFontOfSize:36.0];
        self.welcomeLabel.numberOfLines = 0;
        self.welcomeLabel.textAlignment = NSTextAlignmentLeft;
        [self.myView addSubview:self.welcomeLabel];
        
        self.subtitleLabel = [[UILabel alloc] init];
        self.subtitleLabel.text = @"If you are creating a new wallet press the GENERATE button. Take note of the mnemonic phrase, it should be stored in a safe place.";
        self.subtitleLabel.textColor = [UIColor lightTextColor];
        self.subtitleLabel.font = [UIFont systemFontOfSize:18.0];
        self.subtitleLabel.numberOfLines = 0;
        self.subtitleLabel.textAlignment = NSTextAlignmentLeft;
        [self.myView addSubview:self.subtitleLabel];
        
        self.informationLabel = [[UILabel alloc] init];
        self.informationLabel.text = @"address list elephant genuine thunder conduct avocado educate chronic useless basic rough notable noble water bless labor monster muscle nike view caution river favlor";
        self.informationLabel.textColor = [UIColor whiteColor];
        self.informationLabel.font = [UIFont systemFontOfSize:18.0];
        self.informationLabel.numberOfLines = 0;
        self.informationLabel.textAlignment = NSTextAlignmentCenter;
        [self.myView addSubview:self.informationLabel];
        
        self.generateWalletButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.generateWalletButton setTitle:@"Generate Wallet" forState:UIControlStateNormal];
        [self.generateWalletButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.generateWalletButton.backgroundColor = [UIColor colorNamed:@"myPrimaryBgColor"];
        self.generateWalletButton.layer.cornerRadius = 10;
        [self.myView addSubview:self.generateWalletButton];
        
        self.qRCaptureButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.qRCaptureButton setTitle:@"QR Capture" forState:UIControlStateNormal];
        [self.qRCaptureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.qRCaptureButton.backgroundColor = [UIColor clearColor];
        [self.myView addSubview:self.qRCaptureButton];
        
        self.accessWalletButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.accessWalletButton setTitle:@"Access Wallet" forState:UIControlStateNormal];
        [self.accessWalletButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.accessWalletButton.backgroundColor = [UIColor colorNamed:@"myButtonColor"];
        self.accessWalletButton.layer.cornerRadius = 10;
        [self.myView addSubview:self.accessWalletButton];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints {
    self.myView.translatesAutoresizingMaskIntoConstraints = NO;
    self.welcomeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.informationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.generateWalletButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.qRCaptureButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.accessWalletButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.myView.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor].active = YES;
    [self.myView.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor].active = YES;
    [self.myView.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor].active = YES;
    [self.myView.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor constant:-32].active = YES;
    
    [self.welcomeLabel.centerXAnchor constraintEqualToAnchor:self.myView.centerXAnchor].active = YES;
    [self.welcomeLabel.topAnchor constraintEqualToAnchor:self.myView.safeAreaLayoutGuide.topAnchor].active = YES;
    [self.welcomeLabel.leadingAnchor constraintEqualToAnchor:self.myView.safeAreaLayoutGuide.leadingAnchor constant:16].active = YES;
    [self.welcomeLabel.trailingAnchor constraintEqualToAnchor:self.myView.safeAreaLayoutGuide.trailingAnchor constant:-16].active = YES;
    
    [self.subtitleLabel.centerXAnchor constraintEqualToAnchor:self.myView.centerXAnchor].active = YES;
    [self.subtitleLabel.topAnchor constraintEqualToAnchor:self.welcomeLabel.bottomAnchor constant:24].active = YES;
    [self.subtitleLabel.leadingAnchor constraintEqualToAnchor:self.myView.safeAreaLayoutGuide.leadingAnchor constant:16].active = YES;
    [self.subtitleLabel.trailingAnchor constraintEqualToAnchor:self.myView.safeAreaLayoutGuide.trailingAnchor constant:-16].active = YES;
    
    [self.informationLabel.centerXAnchor constraintEqualToAnchor:self.myView.centerXAnchor].active = YES;
    [self.informationLabel.topAnchor constraintEqualToAnchor:self.subtitleLabel.bottomAnchor constant:64].active = YES;
    [self.informationLabel.leadingAnchor constraintEqualToAnchor:self.myView.safeAreaLayoutGuide.leadingAnchor constant:16].active = YES;
    [self.informationLabel.trailingAnchor constraintEqualToAnchor:self.myView.safeAreaLayoutGuide.trailingAnchor constant:-16].active = YES;
    
    [self.generateWalletButton.leadingAnchor constraintEqualToAnchor:self.myView.safeAreaLayoutGuide.leadingAnchor constant:30].active = YES;
    [self.generateWalletButton.trailingAnchor constraintEqualToAnchor:self.myView.safeAreaLayoutGuide.trailingAnchor constant:-30].active = YES;
    [self.generateWalletButton.topAnchor constraintEqualToAnchor:self.informationLabel.bottomAnchor constant:64].active = YES;
    [self.generateWalletButton.heightAnchor constraintEqualToConstant:60].active = YES;
    
    [self.qRCaptureButton.centerXAnchor constraintEqualToAnchor:self.myView.centerXAnchor].active = YES;
    [self.qRCaptureButton.topAnchor constraintEqualToAnchor:self.generateWalletButton.bottomAnchor constant:16].active = YES;
    
    [self.accessWalletButton.leadingAnchor constraintEqualToAnchor:self.myView.safeAreaLayoutGuide.leadingAnchor constant:30].active = YES;
    [self.accessWalletButton.trailingAnchor constraintEqualToAnchor:self.myView.safeAreaLayoutGuide.trailingAnchor constant:-30].active = YES;
    [self.accessWalletButton.topAnchor constraintEqualToAnchor:self.qRCaptureButton.bottomAnchor constant:64].active = YES;
    [self.accessWalletButton.heightAnchor constraintEqualToConstant:60].active = YES;
    [self.accessWalletButton.bottomAnchor constraintEqualToAnchor:self.myView.safeAreaLayoutGuide.bottomAnchor constant:-32].active = YES;

}

@end
