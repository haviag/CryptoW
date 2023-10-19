//
//  CryptoDataController.m
//  CryptoW
//
//  Created by Harold Villacob on 18/10/23.
//

#import "CryptoDataController.h"

@implementation CryptoDataController

- (instancetype)init {
    self = [super init];
    if (self) {
        // Inicializa el arreglo para almacenar los datos de las criptomonedas.
        _cryptoCurrencies = [NSDictionary dictionary];
    }
    return self;
}

- (void)loadCryptoDataFromJSON {
    // Aquí debes cargar y analizar el JSON en el arreglo cryptoCurrencies.
    // Asumiremos que ya has analizado el JSON y has almacenado los datos en el formato correcto.
    NSString *jsonFilePath = [[NSBundle mainBundle] pathForResource:@"cryptoData" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonFilePath];
    
    if (jsonData) {
        NSError *error;
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        
        if (jsonObject && !error) {
            // Asumiendo que el JSON contiene un arreglo llamado "data".
            self.cryptoCurrencies = jsonObject[@"data"];
        }
    }
}

- (void)loadCryptoDataFromAPI {
    // URL de la API de CoinMarketCap
    NSString *apiKey = @"7a6ab6a3-ee28-4074-89c7-5e08cbb640b5"; // Tu clave de API
    NSString *urlString = [NSString stringWithFormat:@"https://pro-api.coinmarketcap.com/v1/cryptocurrency/category?id=605e2ce9d41eae1066535f7c&start=1&limit=20&convert=USD"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // Configura la solicitud con el encabezado de la API Key
    [request setValue:apiKey forHTTPHeaderField:@"X-CMC_PRO_API_KEY"];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error al realizar la solicitud: %@", error);
            return;
        }
        
        NSError *jsonError;
        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
        
        if (jsonError) {
            NSLog(@"Error al analizar JSON: %@", jsonError);
            return;
        }
        
        // Procesa los datos y almacena las criptomonedas en el arreglo cryptoCurrencies
        NSDictionary *cryptoArray = jsonResponse[@"data"];
        self.cryptoCurrencies = cryptoArray;
        
        // Notifica a un delegado (puedes agregar uno en CryptoDataController) que los datos se han cargado
        if ([self.delegate respondsToSelector:@selector(cryptoDataDidUpdate)]) {
            [self.delegate cryptoDataDidUpdate];
        }
    }];
    
    [task resume];
}

@end
