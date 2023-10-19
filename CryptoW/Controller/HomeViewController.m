//
//  ViewController.m
//  CryptoW
//
//  Created by Harold Villacob on 17/10/23.
//

#import "HomeViewController.h"
#import "CryptoDataController.h"
#import "CryptoCell.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource, CryptoDataControllerDelegate>

@property (strong, nonatomic) UITableView *myTableView;
@property (strong, nonatomic) CryptoDataController *cryptoDataController;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.cryptoDataController = [[CryptoDataController alloc] init];
    self.cryptoDataController.delegate = self;
    
//    [self.cryptoDataController loadCryptoDataFromAPI];
    [self.cryptoDataController loadCryptoDataFromJSON];
    [self.myTableView registerClass:[CryptoCell class] forCellReuseIdentifier:@"CryptoCell"];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    [self.view addSubview:self.myTableView];
    
}

- (void)cryptoDataDidUpdate {
    // Realiza las acciones que desees después de cargar los datos
    // Puedes actualizar tu UITableView aquí para reflejar los nuevos datos.
//    [self.myTableView reloadData]; // Actualiza la tabla cuando los datos se carguen
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        // Realiza ajustes en la interfaz aquí si es necesario.
        // Por ejemplo, actualiza las restricciones o realinea elementos.
        self.myTableView.frame = CGRectMake(0, 0, size.width, size.height);
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        // Luego de la transición, actualiza la tabla.
        [self.myTableView reloadData];
    }];
}


// MARK: DataSource TableView
// MARK: Delegate TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 18;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CryptoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CryptoCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[CryptoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CryptoCell"];
    }
    
    NSDictionary *cryptoData = self.cryptoDataController.cryptoCurrencies[@"coins"][indexPath.row];
    NSString *slug = cryptoData[@"slug"];
    NSString *symbol = cryptoData[@"symbol"];
    
    // Accede al precio y porcentaje de cambio según la estructura real de tus datos
    NSDictionary *quoteData = cryptoData[@"quote"][@"USD"];
    NSNumber *price = quoteData[@"price"];
    NSNumber *percentChange24h = quoteData[@"percent_change_24h"];
    
    // Llena los datos en las celdas
    cell.nameLabel.text = slug;
    cell.symbolLabel.text = symbol;
    cell.priceLabel.text = [NSString stringWithFormat:@"$%.2f", [price floatValue]];
    cell.percentChangeLabel.text = [NSString stringWithFormat:@"%.2f%%", [percentChange24h floatValue]];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Home";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     
}

@end
