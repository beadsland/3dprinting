height=60;
width=10;
breadth=30;

spacing = 10;
radius = 1;

translate([0,breadth,0]) mirror([0,1,0]) diagonals(width, breadth, height);
diagonals(width, breadth, height);
translate([width,0,0]) rotate([0,0,90]) diagonals(breadth, width, height);
rotate([0,0,90]) mirror([0,1,0]) diagonals(breadth, width, height);

translate([0,0,height-1]) cube([width,breadth,1]);
cube([width,breadth,2]);

module diagonals(w, b, h) {  
    d = sqrt((h*h) + (h*h));
    intersection() {
        translate([-radius/2,-radius/2,0]) cube([w+radius*2, b+radius*2, h]);
        for (i = [0 : spacing : w]) {
            for (j = [spacing : spacing : b]) {
                translate([i,j,0]) rotate([45,0,0]) cylinder(d, radius, radius);
            }
            for (j = [spacing: spacing: height]) {
                translate([i,b,j]) rotate([45,0,0]) cylinder(d, radius, radius);
            }
        }
    }
}
