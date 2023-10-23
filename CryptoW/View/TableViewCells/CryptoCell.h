//
//  CryptoCell.h
//  CryptoW
//
//  Created by Harold Villacob on 18/10/23.
//

#import <UIKit/UIKit.h>

@interface CryptoCell : UITableViewCell

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *symbolLabel;
@property (strong, nonatomic) UILabel *percentChangeLabel;
@property (strong, nonatomic) UIStackView *priceAndPercentajeStackView;
@property (strong, nonatomic) UIStackView *nameAndSymbolStackView;
@property (strong, nonatomic) UIImageView *cryptoImageView;

-(void)configureCell:(NSString *)name symbol:(NSString *)symbol price:(NSString *)price percentChange:(NSString *)percentChange imageUrl:(NSString *)imageUrl;

@end
