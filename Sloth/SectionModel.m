//
//  SectionModel.m
//  Sloth
//
//  Created by Samir Lavingia on 12/04/2014.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import "SectionModel.h"
#import <Parse/Parse.h>

//@interface SectionModel()
//
//@property (strong, nonatomic) PFObject* userInfo;
//
//@end
static PFObject* userInfo = nil;

@implementation SectionModel
  @synthesize sectionName;
  @synthesize startTime;
  @synthesize endTime;
  @synthesize xLocation;
  @synthesize yLocation;
  @synthesize daysOfClass;



  static NSMutableArray* setOfSections;



  -(id) init
  {
    self = [super init];
    if(setOfSections == nil)
    {
      setOfSections = [[NSMutableArray alloc] init];
    }
    
    if(self)
    {
      //do something
    }
    [setOfSections addObject:self];
    return self;
  }

-(id) initWithSectionName: (NSString *) name
             andStartTime: (NSString *) start
             andxLoc: (double) x
             andyLoc: (double) y
             andEndTime: (NSString *) end
             andDays: (NSString * ) days
{
  self = [super init];

  self.sectionName = name;
  self.startTime = start;
  self.endTime = end;
  self.xLocation = x;
  self.yLocation = y;
  for (int i = 0; i < [days length]; i++) {
    if([days characterAtIndex:i] == '1')
    {
      [daysOfClass replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:YES]];
    }else{
      [daysOfClass replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:NO]];
    }
  }
  
  if(setOfSections == nil)
  {
    setOfSections = [[NSMutableArray alloc] init];
  }

  [setOfSections addObject:self];

[SectionModel getFormattedString];
  return self;
}

+(NSMutableArray*) getSections
{
  return setOfSections;
}

+(NSMutableString *) getFormattedString
{
  NSMutableString* formattedString = [[NSMutableString alloc]init];
  
  for(int i = 0; i < [setOfSections count]; i++)
  {
    NSMutableString* days = [[NSMutableString alloc] init];
    for(int j = 0; j < 5; j++)
    {
      if([[[setOfSections objectAtIndex:i] daysOfClass] objectAtIndex:j] == [NSNumber numberWithBool:YES])
      {
        [days appendString: @"1"];
      }else{
        [days appendString: @"0"];
      }
    }
    if(i == [setOfSections count] - 1)
    {
      [formattedString appendString: [NSString stringWithFormat:@"%@|%@|%@|%f|%f|%@", [[setOfSections objectAtIndex:i] sectionName], [[setOfSections objectAtIndex:i] startTime], [[setOfSections objectAtIndex:i] endTime], [[setOfSections objectAtIndex:i] xLocation], [[setOfSections objectAtIndex:i] yLocation], days]];
    }else{
      [formattedString appendString: [NSString stringWithFormat:@"%@|%@|%@|%f|%f|%@|", [[setOfSections objectAtIndex:i] sectionName], [[setOfSections objectAtIndex:i] startTime], [[setOfSections objectAtIndex:i] endTime], [[setOfSections objectAtIndex:i] xLocation], [[setOfSections objectAtIndex:i] yLocation], days]];
    }
  }
  
   
    
    NSString *_formattedString = (NSString*)formattedString;
    
    PFObject *userInfo = [PFObject objectWithClassName:@"UserInfo"];
    userInfo[@"formattedString"] = _formattedString;
    [userInfo saveInBackground];
    
     NSLog(@"TITTIES");
    
    return formattedString;
}


@end

