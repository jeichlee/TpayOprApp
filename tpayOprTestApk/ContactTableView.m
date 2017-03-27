//
//  ContactTableView.m
//  tpayOprTestApk
//
//  Created by Kyungsoo.Cho on 2017. 3. 21..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import <ContactTableView.h>

@interface ContactTableView ()

@end

@implementation ContactTableView


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"contact";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = @"조경수";
    cell.detailTextLabel.text = @"01038324035";
    
    return cell;
}


@end
