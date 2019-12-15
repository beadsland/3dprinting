wall = .8;
width = 62.0;
length = 104.4;
depth = 8.3;

hold_offset = 8.3;
hold_float = 2.7;
hold_width = 12.3;
hold_height = 3.2;

difference() {
    rough_box(wall, width, length, depth);

    color([0,1,0]) translate([width-hold_offset-hold_width, 0, hold_float]) cube([hold_width, wall, hold_height]);
}

module rough_box(wall, width, length, depth) {
    cube([width,length,wall]);

    cube([width,wall,depth]);
    translate([0,length-wall,0]) cube([width,wall,depth]);

    cube([wall,length,depth]);
    translate([width-wall,0,0]) cube([wall,length,depth]);
}