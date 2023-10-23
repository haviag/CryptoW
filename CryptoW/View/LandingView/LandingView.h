//
//  UIView+LandingView.h
//  CryptoW
//
//  Created by Harold Villacob on 23/10/23.
//

#import <UIKit/UIKit.h>


@interface LandingView : UIView

@property (strong, nonatomic) UIView *myView;
@property (strong, nonatomic) UILabel *welcomeLabel;
@property (strong, nonatomic) UILabel *subtitleLabel;
@property (strong, nonatomic) UILabel *informationLabel;
@property (strong, nonatomic) UIButton *generateWalletButton;
@property (strong, nonatomic) UIButton *qRCaptureButton;
@property (strong, nonatomic) UIButton *accessWalletButton;

@end
