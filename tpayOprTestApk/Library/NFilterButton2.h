//
//  NFilterToolbarButton.h
//  ToolbarTest
//
//  Created by bhchae on 2016. 7. 14..
//  Copyright © 2016년 bhchae. All rights reserved.
//

#import "NFView.h"
#import "nFilterTypes.h"

@protocol NFilterToolbar2Delegate <NSObject>
- (void) NFilterToolbarButtonClick:(NFilterButtonType)buttonType withButton :(UIButton *)button;
@end

@interface NFilterButton2 : NFView

@property (nonatomic, readonly) UIButton *button;
@property (nonatomic, assign) NFilterButtonType nFilterbuttonType;
@property (nonatomic, assign) id <NFilterToolbar2Delegate> delegate;

@end
