//
//  DLogHeader.h
//  LessonApplication
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif