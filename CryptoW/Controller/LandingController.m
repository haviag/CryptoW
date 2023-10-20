//
//  LandingController.m
//  CryptoW
//
//  Created by Harold Villacob on 19/10/23.
//

#import "LandingController.h"
#import "HomeViewController.h"

@interface LandingController ()

@property (strong, nonatomic) UIView *myView;
@property (strong, nonatomic) UILabel *welcomeLabel;
@property (strong, nonatomic) UILabel *subtitleLabel;
@property (strong, nonatomic) UILabel *informationLabel;
@property (strong, nonatomic) UIButton *generateWalletButton;
@property (strong, nonatomic) UIButton *qRCaptureButton;
@property (strong, nonatomic) UIButton *accessWalletButton;


@end

@implementation LandingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.myView.backgroundColor = [UIColor darkGrayColor];
    
    [self.view addSubview:self.myView];
    
    self.welcomeLabel = [[UILabel alloc] init];
    self.welcomeLabel.text = @"Welcome to CryptoWallet!";
    self.welcomeLabel.textColor = [UIColor whiteColor];
    self.welcomeLabel.font = [UIFont boldSystemFontOfSize:36.0];
    self.welcomeLabel.numberOfLines = 0;
    self.welcomeLabel.textAlignment = NSTextAlignmentLeft;
    [self.myView addSubview:self.welcomeLabel];
    
    self.subtitleLabel = [[UILabel alloc] init];
    self.subtitleLabel.text = @"If you are creating a new wallet press the GENERATE button. Take note of the mnemonic phrase, it should be stored in a safe place.";
    self.subtitleLabel.textColor = [UIColor whiteColor];
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
    self.generateWalletButton.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
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
    self.accessWalletButton.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
    self.accessWalletButton.layer.cornerRadius = 10;
    [self.accessWalletButton addTarget:self action:@selector(accessWalletTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.myView addSubview:self.accessWalletButton];
    
    [self setupConstraints];
}

- (void)setupConstraints {
    self.welcomeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.informationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.generateWalletButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.qRCaptureButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.accessWalletButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.welcomeLabel.centerXAnchor constraintEqualToAnchor:self.myView.centerXAnchor].active = YES;
    [self.welcomeLabel.topAnchor constraintEqualToAnchor:self.myView.topAnchor constant:100].active = YES;
    [self.welcomeLabel.leadingAnchor constraintEqualToAnchor:self.myView.leadingAnchor constant:8].active = YES;
    [self.welcomeLabel.trailingAnchor constraintEqualToAnchor:self.myView.trailingAnchor constant:-8].active = YES;
    
    [self.subtitleLabel.centerXAnchor constraintEqualToAnchor:self.myView.centerXAnchor].active = YES;
    [self.subtitleLabel.topAnchor constraintEqualToAnchor:self.welcomeLabel.bottomAnchor constant:24].active = YES;
    [self.subtitleLabel.leadingAnchor constraintEqualToAnchor:self.myView.leadingAnchor constant:8].active = YES;
    [self.subtitleLabel.trailingAnchor constraintEqualToAnchor:self.myView.trailingAnchor constant:-8].active = YES;
    
    [self.informationLabel.centerXAnchor constraintEqualToAnchor:self.myView.centerXAnchor].active = YES;
    [self.informationLabel.topAnchor constraintEqualToAnchor:self.subtitleLabel.bottomAnchor constant:64].active = YES;
    [self.informationLabel.leadingAnchor constraintEqualToAnchor:self.myView.leadingAnchor constant:8].active = YES;
    [self.informationLabel.trailingAnchor constraintEqualToAnchor:self.myView.trailingAnchor constant:-8].active = YES;
    
    [self.generateWalletButton.leadingAnchor constraintEqualToAnchor:self.myView.leadingAnchor constant:30].active = YES;
    [self.generateWalletButton.trailingAnchor constraintEqualToAnchor:self.myView.trailingAnchor constant:-30].active = YES;
    [self.generateWalletButton.topAnchor constraintEqualToAnchor:self.informationLabel.bottomAnchor constant:64].active = YES;
    [self.generateWalletButton.heightAnchor constraintEqualToConstant:60].active = YES;
    
    [self.qRCaptureButton.centerXAnchor constraintEqualToAnchor:self.myView.centerXAnchor].active = YES;
    [self.qRCaptureButton.topAnchor constraintEqualToAnchor:self.generateWalletButton.bottomAnchor constant:16].active = YES;
    
    [self.accessWalletButton.leadingAnchor constraintEqualToAnchor:self.myView.leadingAnchor constant:30].active = YES;
    [self.accessWalletButton.trailingAnchor constraintEqualToAnchor:self.myView.trailingAnchor constant:-30].active = YES;
    [self.accessWalletButton.topAnchor constraintEqualToAnchor:self.qRCaptureButton.bottomAnchor constant:64].active = YES;
    [self.accessWalletButton.heightAnchor constraintEqualToConstant:60].active = YES;
}

- (void)accessWalletTapped {
    HomeViewController *homeVC = [[HomeViewController alloc] init];

    [self.navigationController pushViewController:homeVC animated:YES];
}

@end
