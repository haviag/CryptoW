//
//  LandingController.m
//  CryptoW
//
//  Created by Harold Villacob on 19/10/23.
//

#import "LandingController.h"
#import "HomeController.h"
#import "CryptoDataController.h"

@implementation LandingController

@synthesize landingView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorNamed:@"MyBackgoundColor"];
    landingView = [[LandingView alloc] init];
    landingView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [landingView.accessWalletButton addTarget:self action:@selector(accessWalletTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:landingView];
}

- (void)accessWalletTapped {
    CryptoDataController *cryptoDataController = [[CryptoDataController alloc] init];
    HomeController *homeVC = [[HomeController alloc] initWithCryptoData:cryptoDataController];
    
    [self.navigationController pushViewController:homeVC animated:YES];
}

@end
