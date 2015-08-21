//
//  MapaViewController.h
//  Mapa
//
//  Created by 0x00 on 21/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapaViewController : UIViewController <CLLocationManagerDelegate>
- (IBAction)btnAtras:(id)sender;


@property (strong, nonatomic) IBOutlet UIView *vMap;

@property (strong, nonatomic)   CLLocationManager   *locationManager;
@property (strong, nonatomic)   CLLocation          *location;

@end
