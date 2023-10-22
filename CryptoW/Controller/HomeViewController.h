//
//  HomeViewController.h
//  CryptoW
//
//  Created by Harold Villacob on 17/10/23.
//

#import <UIKit/UIKit.h>
#import "CryptoDataController.h"

@interface HomeViewController : UIViewController

@property (strong, nonatomic) CryptoDataController *cryptoDataController;
-(instancetype)initWithCryptoData:(CryptoDataController *)cryptoData;

@end

