//
//  main.m
//  mobiruby-ios
//
//  Created by Yuichiro MASUI on 9/10/12.
//  Copyright (c) 2012 MobiRuby Developers. All rights reserved.
//

#import <UIKit/UIKit.h>

#include "cocoa.h"
#include "mobiruby_common.h"

#include <mruby/proc.h>
#include <mruby/dump.h>


extern const char mruby_data_app[];

void init_cocoa_bridgesupport(mrb_state *mrb);

static
void mrb_state_init(mrb_state *mrb)
{
    init_cocoa_bridgesupport(mrb);
}

int main(int argc, char *argv[])
{
    @autoreleasepool {
        NSLog(@"main>1");
        mrb_state *mrb = mrb_open();
        NSLog(@"main>2");
        mrb_state_init(mrb);
        NSLog(@"main>3");
        
        mrb_load_irep(mrb, mruby_data_app);
        if (mrb->exc) {
            mrb_p(mrb, mrb_obj_value(mrb->exc));
            exit(0);
        }
        NSLog(@"main>5");
        
        if (mrb->exc) {
            mrb_p(mrb, mrb_obj_value(mrb->exc));
        }
        NSLog(@"main>6");
        
        return UIApplicationMain(argc, argv, nil, @"AppDelegate");
    }
}
