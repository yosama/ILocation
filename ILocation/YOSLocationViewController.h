//
//  YOSLocationViewController.h
//  ILocation
//
//  Created by Yosnier on 10/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;

@interface YOSLocationViewController : UIViewController<CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *address;

@property (strong,nonatomic) CLLocationManager *manager;

- (IBAction)andeEstoy:(id)sender;



@end
            