//
//  SectionModel.m
//  Sloth
//
//  Created by Samir Lavingia on 12/04/2014.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import "SectionModel.h"

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
  return self;
}

+(NSMutableArray*) getSections
{
  return setOfSections;
}

@end

