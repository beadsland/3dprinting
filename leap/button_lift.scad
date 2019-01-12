
outer = 28;
inner = 13.25;
ring_height = 6;
straddle_height = 6;
straddle_width = 2;

translate([0,0,-ring_height]) difference() {
    cylinder(ring_height, d=outer);
    cylinder(ring_height, d=inner);
}

difference() {
    cylinder(straddle_height, d=outer);
    translate([-outer/2+straddle_width,-outer/2,0]) cube([outer-straddle_width*2,outer+straddle_width*2,straddle_height]);
}