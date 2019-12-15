
// Try w/ 70% infill

outer = 26.5;
inner = 14;
ring_height = 4.5; //4.5; // 6
straddle_height = 8; //6
straddle_width = 2 * 2;

mold_diam = outer + 4;
mold_height = straddle_height + ring_height;

ring();
//mold();

module mold() {
    difference() {
        translate([0,0,-ring_height]) cylinder(mold_height, d=mold_diam);
        ring();
    }
}

module ring() {
    translate([0,0,-ring_height]) difference() {
        cylinder(ring_height, d=outer);
        cylinder(ring_height, d=inner);
    }

    difference() {
        cylinder(straddle_height, d=outer);
        translate([-outer/2+straddle_width,-outer/2,0]) cube([outer-straddle_width*2,outer+straddle_width*2,straddle_height]);
    }
}