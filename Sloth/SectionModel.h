//
//  SectionModel.h
//  Sloth
//
//  Created by Samir Lavingia on 12/04/2014.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SectionModel : NSObject

  @property (nonatomic) double xLocation;
  @property (nonatomic) double yLocation;
  @property (nonatomic,retain) NSString *sectionName;
  @property (nonatomic,retain) NSString *startTime;
  @property (nonatomic,retain) NSString *endTime;
  @property (nonatomic) NSMutableArray* daysOfClass;

-(id) initWithSectionName: (NSString *) name
             andStartTime: (NSString *) start
                  andxLoc: (double) x
                  andyLoc: (double) y
               andEndTime: (NSString *) end
                  andDays: (NSString * ) days;
+(NSMutableArray *) getSections;
+(NSString *) getFormattedString;

@end

