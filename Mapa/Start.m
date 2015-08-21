//
//  ViewController.m
//  Mapa
//
//  Created by 0x00 on 21/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import "Start.h"
#import "Declarations.h"
#import "cellMapa.h"
#import "MapaViewController.h"
 #import <Google/Analytics.h>
#import "GAI.h"

@interface Start ()

@end

@implementation Start

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController]; //carga la función initController
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated // new
{
    NSLog(@"viewDidAppear");
    [super viewDidAppear:animated];
    
    [self.tblStart reloadData];
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Mapa-Start"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}


/*-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Initialize a tracker using a Google Analytics property ID.
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-30831480-3"];
    
    id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:@"UA-30831480-3"];
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"appview", kGAIHitType, @"Mapa:Start", kGAIScreenName, nil];
    [tracker send:params];
    
   
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Mapa:Start"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}*/

//-------------------------------------------------------------------------------
- (void)initController {
    
    //Initialize arrays
    maCountries         = [[NSMutableArray alloc] initWithObjects: @"México", @"Paris", @"Londres", @"Madrid", nil];
    maPlacesLat     = [[NSMutableArray alloc] initWithObjects: @"19.303170", @"48.858282",@"51.481399",@"40.453256", nil];
    maPlacesLng     = [[NSMutableArray alloc] initWithObjects: @"-99.150324", @"2.294385",@"-0.191321",@"-3.688551", nil];
    
   
    
    
    
}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return maCountries.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Initialize cells
    cellMapa *cell = (cellMapa *)[tableView dequeueReusableCellWithIdentifier:@"cellMapa"];
    
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellMapa" bundle:nil] forCellReuseIdentifier:@"cellMapa"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellMapa"];
    }
    //Fill cell with info from arrays
    cell.lblPais.text  =maCountries[indexPath.row];
    
    return cell;
    
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    miCellIndexPais = (int)indexPath.row;
    
    
    
    MapaViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MapaViewController"];
    
    [self presentViewController:viewController animated:YES completion:nil];
    
    
}


@end
