//
//  log.h
//  Pods
//
//  Created by 戚昌研 on 2017/7/21.
//
//

#ifndef log_h
#define log_h

#import <ReactiveObjC/RACmetamacros.h>

#define QYLog(fmt, ...) NSLog((@"%s [Line %d] %@" fmt), __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread], ##__VA_ARGS__)
#define QYLogVars(...) metamacro_foreach(QYLogIterItem,, __VA_ARGS__)
#define QYLogIterItem(INDEX, VAR) QYLog(@"%s: %@", #VAR, (VAR));

#if !defined(Dlog) && !defined(Dlogvars)
#ifdef DEBUG
#define Dlog(fmt, ...)     QYLog(fmt, __VA_ARGS__)
#define Dlogvars(...) QYLogVars(__VA_ARGS__)
#else
#define Dlog(fmt, ...)
#define Dlogvars(...)
#endif
#endif

#endif /* log_h */
