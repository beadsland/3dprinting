use <../lib/lego.scad>;

sink_depth = 2.8;
m5_diam = 5;
m5_drill = 5;


//frame(pegs=true);

back();

translate([-30, 50, 0]) base(slope=15);

translate([-30, 0, 0])  sheath(slope=15);


module sheath(width=20, length=40, depth=3, hole=8, post_inset=3, post_height=20, slope=5) {
    union() {
        difference() {
            post(width, length, post_height-depth, hole, post_inset, 5.5, slope);
            translate([1,0,0]) post(width, length, post_height-depth, hole, post_inset,2, slope);
        translate([width/2-post_inset,0,0]) cube([9.25,length,3]);
        }

        rotate([0,slope,0]) {
            translate([post_inset, (length-3*brick_unit())/2 ,.5]) rotate([0,-90,0]) brick(grid=[3,3], height=0, hollow=false);
  //        translate([post_inset,(length-3*brick_unit())/2+brick_unit(),-brick_unit()/5]) rotate([0,-90,0]) brick(grid=[1,3], height=0, hollow=false);
        }
    }
}

module base(width=20, length=40, depth=3, hole=8, drill=5, post_inset=1, post_height=20, slope=5) {
    difference() {
        cube([width, length, depth]);
        translate([width/2, hole, 0]) cylinder(d=drill, depth);
        translate([width/2, length-8, 0]) cylinder(d=drill, depth);
    }
    post(width, length, post_height, hole, post_inset, 0, slope);
}

module post(width, length, height, hole, inset, extra=0, slope) {
    round = (width+inset)*.3;
    diam = length-(2*hole)+2*extra;
    intersection() {
        post_core(width, length, height, hole, inset, extra, round, slope);
        union() {
            difference() {
                color([1,0,0]) translate([round, length/2, height+extra-1.5*round]) sphere(d=diam);
                color([1,1,0]) translate([round-diam/2, length/2-diam/2, height+extra-1.5*round-diam/2]) cube([diam, diam, diam/2]);
            }
        }
    }

        intersection() {
            post_core(width, length, height, hole, inset, extra, round, slope);
            color([1,1,0]) translate([round-diam/2, length/2-diam/2, height+(extra-1.5*round-diam/2)]) cube([diam, diam, diam/2]);
       }
    }

module post_core(width, length, height, hole, inset, extra, round, slope) {
    intersection() {
        difference() {
            linear_extrude(height+2*extra) polygon(points=[ [inset-extra, hole-extra], [inset-extra, length-hole+extra], [width+extra, length/2] ]);
            color([1,0,1]) rotate([0, slope,0]) translate([-slope,hole-extra,-5]) cube([inset+slope,length-2*hole+2*extra,height+2*extra+10]);
        }
        color([0,1,0]) translate([round, length/2, 0]) cylinder(d=width+2*extra, height+2*extra);
    }
}

module frame(width=8, length=12, pegs=true) {
    union() {
        length = length -2;
        translate([0, brick_unit(), 0]) plate([length,1], pegs, hollow=false, posts=false);

        translate([brick_unit()*(width-1),  brick_unit(), 0]) plate([length,1], pegs, hollow=false, posts=false);
        plate([1,width], pegs, hollow=false, posts=false);
        translate([0,brick_unit()*(length+1),0]) plate([1,width], pegs, hollow=false, posts=false);
    }
}

module back(shallow = .16) {
    letterbox = (12-3)/2*brick_unit();
    difference() {
        union() {
            frame(8,12);
            translate([1*brick_unit(), 1*brick_unit(), 0]) frame(6,10, false);
            translate([2*brick_unit(), 2*brick_unit(), 0]) frame(4,8, false);
            translate([3*brick_unit(), 3*brick_unit(), 0]) frame(2,6, false);

            cube([8*brick_unit(), letterbox, 2*lego_unit()]);
            translate([0, 12*brick_unit()-letterbox, 0]) cube([8*brick_unit(), letterbox, 2*lego_unit()]);
            cube([5*brick_unit(), 12*brick_unit(), 2*lego_unit()]);
        }
        color([0,1,0]) translate([.75*brick_unit(),.75*brick_unit(),2*lego_unit()-shallow]) cube([6.5*brick_unit(),10.5*brick_unit(), shallow]);
    }
}
