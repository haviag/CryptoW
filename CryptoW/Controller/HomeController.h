//
//  HomeViewController.h
//  CryptoW
//
//  Created by Harold Villacob on 17/10/23.
//

#import <UIKit/UIKit.h>
#import "CryptoDataModel.h"
#import "HomeTableView.h"

@interface HomeController : UIViewController <UITableViewDelegate, UITableViewDataSource, CryptoDataControllerDelegate>

@property (strong, nonatomic) CryptoDataModel *cryptoDataModel;
@property (strong, nonatomic) HomeTableView *myHomeTableView;

-(instancetype)initWithCryptoData:(CryptoDataModel *)cryptoData;

@end

