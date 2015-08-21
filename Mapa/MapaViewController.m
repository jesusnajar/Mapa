//
//  MapaViewController.m
//  Mapa
//
//  Created by 0x00 on 21/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import "MapaViewController.h"
#import "Declarations.h"
#import "cellMapa.h"
#import "Start.h"
#import <Google/Analytics.h>

@import GoogleMaps;



@interface MapaViewController ()

@end

@implementation MapaViewController{
 
    GMSMapView *mapView;
}

- (void)viewWillAppear:(BOOL)animated // new
{
    NSLog(@"viewDidAppear");
    [super viewDidAppear:animated];
    
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker set:kGAIScreenName value:@"Mapa-MapaViewController"];
    
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self paintMap];
    [self paintMarker];
}


- (void) paintMap {
    [mapView removeFromSuperview];
    CGFloat lat                     = (CGFloat)[maPlacesLat[miCellIndexPais] floatValue];
    CGFloat lng                     = (CGFloat)[maPlacesLng[miCellIndexPais] floatValue];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:lat
                                                            longitude:lng
                                                                 zoom:6];
    mapView.frame = CGRectMake(0, 0, 0, 0);
    
    mapView = [GMSMapView mapWithFrame:mapView.frame  camera:camera];
    mapView.myLocationEnabled = YES;
    
    self.vMap = mapView;
    
    [self.view addSubview:mapView];
}


- (void) paintMarker {
    CGFloat lat                     = (CGFloat)[maPlacesLat[miCellIndexPais] floatValue];
    CGFloat lng                     = (CGFloat)[maPlacesLng[miCellIndexPais] floatValue];
    mapView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y +80, self.view.frame.size.width, self.vMap.frame.size.height+600);
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(lat, lng);
    marker.title = maCountries[miCellIndexPais];
    marker.snippet = maCountries[miCellIndexPais];
    marker.map = mapView;
    
}

    - (IBAction)btnAtras:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
