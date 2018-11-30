height = 28;
width = 71;
depth = 5;
wall = 5;


line1 = "CR-10 Camera Mount by techyg";
line2 = "licensed under Creative Commons";
line3 = "Attribution license. (CC BY 3.0)";
line4 = "";
line5 = "Placard Bay mod by beadsland.";

size = 3;
line = 3.5;

difference() {
    resize([width-wall/2*2-1,height-wall/2-1,depth/3-1]) cube(height-wall);

    color([1,0,1]) linear_extrude(2) {
        translate([wall/4,height-wall*line/3-(line*1),-5]) text(line1, size);
        translate([wall/4,height-wall*line/3-(line*2),-5]) text(line2, size);
        translate([wall/4,height-wall*line/3-(line*3),-5]) text(line3, size);
        translate([wall/4,height-wall*line/3-(line*4),-5]) text(line4, size);
        translate([wall/4,height-wall*line/3-(line*5),-5]) text(line5, size);
    }
}