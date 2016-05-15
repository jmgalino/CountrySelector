//
//  CountryTableViewController.m
//  CountrySelector
//
//  Created by Jenny Galino on 15/5/16.
//  Copyright © 2016 jmgalino. All rights reserved.
//

#import "CountryTableViewController.h"

@interface CountryTableViewController ()

@property (nonatomic, strong) NSArray* countryArray;

@end

@implementation CountryTableViewController

- (void) viewDidLoad
{
  NSLocale* locale = [NSLocale currentLocale];
  NSArray* countryCodes = [NSLocale ISOCountryCodes];

  NSMutableArray* sortedCountryArray = [NSMutableArray new];

  for (NSString* countryCode in countryCodes)
  {

    NSString* displayNameString = [locale displayNameForKey: NSLocaleCountryCode
                                                      value: countryCode];
    [sortedCountryArray addObject:displayNameString];

  }

  [sortedCountryArray sortUsingSelector:@selector(localizedCompare:)];
  self.countryArray = [sortedCountryArray copy];
}

#pragma mark - UITableViewDataSource methods

- (NSInteger) tableView: (UITableView*) tableView
  numberOfRowsInSection: (NSInteger)    section
{
  return [self.countryArray count];
}

- (UITableViewCell*) tableView: (UITableView*) tableView
         cellForRowAtIndexPath: (NSIndexPath*) indexPath
{
  return [tableView dequeueReusableCellWithIdentifier: @"BasicCell"];
}

#pragma mark - UITableViewDelegate methods

- (void) tableView: (UITableView*)     tableView
   willDisplayCell: (UITableViewCell*) cell
 forRowAtIndexPath: (NSIndexPath*)     indexPath
{
  cell.textLabel.text = [self.countryArray objectAtIndex: indexPath.row];
}

@end
