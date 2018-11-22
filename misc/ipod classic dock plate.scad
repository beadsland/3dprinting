depth = 25.32;
breadth = 69.5;
trough = 11.85;

back =6.97;
front= 11.12;
pins = 22.75;

base = 1;
length = breadth + 10;
width = depth + 10;

difference() {
    translate([-(length-breadth)/2,-(width-depth)/2,-base]) cube([width, length, base+trough]);

    cube([depth, breadth, trough]);

    translate([depth-front,breadth/2-pins/2,-base]) cube([depth-back-front, pins, base]);
}