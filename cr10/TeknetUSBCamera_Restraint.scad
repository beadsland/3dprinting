use <../lib/lego.scad>;

drill=5;
depth=20;
hole=8;
width=2*brick_unit();
length=3*width;
post = 94;

difference() {
//    base();
    rotate([0,0,-90]) translate([-32,-30,0]) post();
//    translate([0,0,5*lego_unit()]) cube([100,100,100]);
}





module base() {
    difference() {
         restraint();
         translate([2*brick_unit(), 3*brick_unit(), -1]) cylinder(d=drill, 2*depth);
    }
}

module post() {
    span=40;
    breadth=20;
    overhang=10;
    winnow=.2*brick_unit();

    translate([-(span-width)/2,-(breadth-width)/2,0]) {
        difference() {
            cube([span+overhang,breadth,3]);
            translate([hole, breadth/2, 0]) cylinder(d=drill, depth);
            translate([span-hole+overhang, breadth/2, 0]) cylinder(d=drill, depth);
        }
    }

    translate([brick_unit(),brick_unit(),0]) {
        difference() {
            linear_extrude(post,twist=40) translate([-brick_unit(), -brick_unit(), 0]) square([2*brick_unit(),2*brick_unit()]);
            translate([0,0,post-depth]) color([0,0,1]) cylinder(d=drill, depth);
        }
    }

    difference() {
        color([0,1,1]) translate([overhang*1.2, 0,-overhang/2]) rotate([0,-30,0]) cube([2*brick_unit(),2*brick_unit()-winnow,2.5*overhang]);
        color([1,1,0]) translate([-overhang*.1,0,0]) cube([2*brick_unit(),2*brick_unit()-winnow,2.5*overhang]);
        color([1,0,1]) translate([overhang*.5,0,-overhang]) cube([2*brick_unit(),2*brick_unit()-winnow,overhang]);
    }
}

cord = 3.5;

module restraint() {
    difference() {
        color([.25,0,.75]) translate([-cord/4,0,0]) riser([.5,2.5,0],[1,1],4);
        color([.75,0,.25]) translate([.5*brick_unit(),3*brick_unit()-cord/2,0]) cube([cord,cord,4*lego_unit()]);
        color([.75,0,.5]) translate([0*brick_unit(),3*brick_unit()-cord/2+cord/32,0]) cube([cord*2,cord-cord/16,4*lego_unit()]);    }
    
    difference() {
        color([.3,.3,0]) plank([1,0,-2], [6,6]);

        color([0,.5,.5]) translate([brick_unit(),2*brick_unit(),-2*lego_unit()]) cube([2*brick_unit(),2*brick_unit(),3]);
        color([.0,0,.75]) translate([brick_unit(),1.75*brick_unit(),-2*lego_unit()]) cube([.5*brick_unit(),2.5*brick_unit(),3]);
        color([.0,0,.75]) translate([2.5*brick_unit(),1.75*brick_unit(),-2*lego_unit()]) cube([.5*brick_unit(),2.5*brick_unit(),3]);
       color([.0,.75,0]) translate([brick_unit(),2*brick_unit(),-2*lego_unit()]) cube([2.25*brick_unit(),0.5*brick_unit(),3]);
       color([.0,.75,0]) translate([brick_unit(),3.5*brick_unit(),-2*lego_unit()]) cube([2.25*brick_unit(),0.5*brick_unit(),3]);

        color([0,0,.5]) translate([4.5*brick_unit(),2.5*brick_unit(),-2*lego_unit()]) cube([brick_unit(), brick_unit(), 3*lego_unit()]);
        
    }
    
    color([1,1,1]) plank([4,0,0], [2.4,3]);
    plank([4,3.6,0], [2.4,3]);

    color([0,1,1]) riser([6,0,0], [1,1],8);
    translate([5.9*brick_unit(),0,-2*lego_unit()]) rotate([0,-50,0]) color([0,1,.6]) riser([0,0,0], [1,1.6],6);
    translate([5.9*brick_unit(),5*brick_unit(),-2*lego_unit()]) rotate([0,-50,0]) color([0,1,.6]) riser([0,0,0], [1,1.6],6);
    riser([6,5,0], [1,1],8);

    color([1,0,0]) plank([1,0,2], [6,3.5]);
    plank([1,0,0], [6,3.5]);

    color([0,1,0]) riser([2,0,4], [2,1.75]);
    riser([2,4,4], [2,1.75]);

    riser([1,0,4], [1,2], 24);
    riser([1,5,4], [1,2], 24);

    color([1,0,0]) riser([2.25,0,22], [1,2]);
    color([1,0,0]) riser([2.25,5,22], [1,2]);

    riser([1,0,4],[2,1],18);
    riser([1,4,4],[2,1],18);
    
    riser([1,1,22],[1,1]);
    riser([1,4,22],[1,1]);

    color([1,0,1]) translate([1*brick_unit(), 3*brick_unit(), 20*lego_unit()]) rotate([-35,0,0]) cube([1*brick_unit(),2*brick_unit(),2*brick_unit()]);
    color([1,0,1]) translate([1*brick_unit(),3*brick_unit(), 20*lego_unit()]) rotate([125,0,0]) cube([1*brick_unit(),2*brick_unit(),2*brick_unit()]);
}        

module plank(pos=[0,0,0], dims=[1,1]) {
    translate([pos[0]*brick_unit(), pos[1]*brick_unit(), pos[2]*lego_unit()]) solid(dims, 2, false);
}

module riser(pos=[0,0,0], dims=[1,1], height=brick_height()) {
    translate([pos[0]*brick_unit(), pos[1]*brick_unit(), pos[2]*lego_unit()]) { //brick(dims, height, false);
           solid(dims, height, false);
    }
}

module solid(dims, height, pegs) {
    cube([dims[1]*brick_unit(), dims[0]*brick_unit(), height*lego_unit()]);
}