//
//  YOSLocationViewController.m
//  ILocation
//
//  Created by Yosnier on 10/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "YOSLocationViewController.h"

@interface YOSLocationViewController ()

@end

@implementation YOSLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.manager = [[CLLocationManager alloc] init];
    self.manager.desiredAccuracy = kCLLocationAccuracyBest;
    self.manager.delegate = self;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)andeEstoy:(id)sender {
    
    [self.manager startUpdatingLocation];
    
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    //Solo me interesa la ultima
    CLLocation *loc = [locations lastObject];
    
    // Indico que para de buscar localizacion para ahorrar bateria
    [manager stopUpdatingLocation];
    
    NSLog(@"Location: %@",loc);
    
    // Geolocalizacion inversa (obtener la direccion).
    CLGeocoder *coder = [[CLGeocoder alloc]init];
    
    [coder reverseGeocodeLocation:loc
                completionHandler:^(NSArray *placemarks, NSError *error) {
                    
                    
                    if (error) {
                        //tenemos direccion
                        self.address.text = [NSString stringWithFormat:@"Estas aqui: %@",placemarks];
                        
                        
                    } else {
                     self.address.text = @"Tas jodio, lobaton sabe ande estas";
                    }
                }];
    
    
    
    
    
    
    
    
    
    
}
@end
