width=43.68;
depth=39.4;
thick=1.55;
dub_thick=2.62;

ridge_thick = 1.95;
ridge_span = 1.61;
ridge_dub_span = 2.42;
shave = 3.1;
shave2 = 2.39;

tab_displace = 16.19;
tab_width = 4.95;
tab_height = 3.42;
tab_thick = 1.54;

tab_divot = 2.15;
tab_divot_thin = 1.07;

nubbin = .94;
nub_wid = 43.93 - width;
nub_disp1 = 9.14;
nub_disp2 = 29.29;

riser_thick = 4.40;
riser_disp = nub_disp1+nubbin/2;
riser_width = 11.18;
riser_span = ridge_dub_span;

riser_divot = 1.11;
riser_divot_thin = 1.19;
riser_divot_wall = 0.94;

pinhole_x = 23.23;
pinhole_y = 1.45;
pinhole_r = 1.45/2;

inset_x = 2.24;
inset_y = 5.65;
inset_len = 8.75;
inset_wid = 3.60;
inset_dep = 0.45;

shallow_x = 8.5;
shallow_y = 26.48;
shallow_len = 19.37;
shallow_wid = 11.14;
shallow_dep = 0.59;

union() {

// Main Plate
difference() {
    union() {
        cube([width, depth, thick]);
        color([1,0,0]) union() {
            cube([ridge_span, depth, ridge_thick]);
            translate([0,depth-ridge_span,0]) cube([width, ridge_span, ridge_thick]);
            translate([width-ridge_dub_span,0,0]) cube([ridge_dub_span, depth, ridge_thick]);


        }
    }

    translate([0-.01,shave-.01,0]) rotate([0,0,-90]) triangle(shave,shave,10);
    translate([width-shave2+.01,0-.01,0]) rotate([0,0,0]) triangle(shave2,shave2,10);
    
    
    translate([pinhole_x,pinhole_y,0]) cylinder(thick*2,r1=pinhole_r,r2=pinhole_r,center=true);
    color([0,0,.5]) translate([inset_x,inset_y,thick-inset_dep]) cube([inset_wid,inset_len,inset_dep*2]);
    color([0,0,.5]) translate([shallow_x,shallow_y,thick-shallow_dep]) cube([shallow_len,shallow_wid,shallow_dep*2]);
}



// tab
difference() {
    color([0,1,0]) translate([-tab_height,tab_displace,ridge_thick-tab_thick]) cube([tab_height,tab_width,tab_thick]);
    color([.5,0,1]) translate([-tab_divot,tab_displace,ridge_thick-tab_thick]) cube([tab_divot,tab_width,tab_divot_thin]);
}

// nubbins
translate([width,nub_disp1,0]) cube([nub_wid,nubbin,ridge_thick]);
translate([width,nub_disp2,0]) cube([nub_wid,nubbin,ridge_thick]);

// riser
difference() {
    color([0,1,0]) translate([width-riser_span,riser_disp,0]) cube([riser_span,riser_width,riser_thick]);
    color([.5,0,1]) translate([width-riser_divot,riser_disp+riser_divot_wall,ridge_thick]) cube([riser_divot,riser_width,riser_divot_thin]);
    color([0,.5,0]) translate([width,riser_disp,ridge_thick+riser_divot]) rotate([0,-45,0]) cube([2,riser_width,2]);
}
}



module triangle(w,h,d){
    difference(){
        cube([w,h,d]);
        rotate([0,0,45]) cube([w+h+d,w+h+d,w+h+d]);
    }
}

