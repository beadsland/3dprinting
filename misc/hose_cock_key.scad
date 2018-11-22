barrel = 12.45/2;
bore = barrel - 1.34;
stem = 9.5/2;

fob = 5.7;
flat = 4;
stretch = 48.9;
thumb = 18.75;
hole = 7.5/2;
inset = 1;

rise1 = 15.2+5;
rise2 = 19.25-5;
rise3 = 7.43;
allrise = rise1 + rise2 + rise3;
space=3;


final();


module final() {
    difference() { 
        cockkey();
        watermark();
        rotate([0,0,180]) watermark();
    }
    riser();
    rotate([0,0,180]) riser();
}

module watermark() {
   #     translate([-stretch/1.8/2,-flat+.9,allrise+inset*2+.5]) rotate([90,0,0]) resize([stretch/1.8,thumb/2.4,1]) linear_extrude(.5) text("    FIRST           ROEBLING");
}    

module riser() {
    render() translate([barrel+space,-(fob+flat)/2,0]) scaffold(stretch/2-barrel-space+2,fob+flat,allrise-inset*2-space,(fob+flat)/2,.5);
}


module cockkey() {
    rotate([0,0,90]) translate([-3, 4, 0]) cube([6, 1, 15.2]);

    difference() {
        union() {
            cylinder(rise1, barrel, barrel, false);;
            translate([0, 0, rise1]) cylinder(rise2, stem, stem, false);
            translate([0, 0, rise1 + rise2]) cylinder(rise3, stem, fob, false);
            translate([0, 0, allrise+thumb/2-inset*3]) resize([stretch, fob*2.25, thumb]) sphere(5);
        }
        translate([0,0,-.1]) cylinder(8, bore, bore, false);
        translate([0,0,8-.2]) cylinder(8,bore,0,false);
        
        translate([-stretch/2+inset*2, flat, allrise]) cube([stretch-inset*4, inset*3, thumb-inset*4]);
        rotate([0,0,180]) translate([-stretch/2+inset*2, flat, allrise]) cube([stretch-inset*4, inset*3, thumb-inset*4]);
        translate([0,fob,allrise+thumb/2-inset*2]) rotate([90,0,0]) cylinder(fob*3, hole, hole, false);
    }
}


module scaffold(width, breadth, height, spacing, radius) {
    translate([0,breadth,0]) mirror([0,1,0]) diagonals(width, breadth, height, spacing, radius);
    diagonals(width, breadth, height, spacing, radius);
    translate([width,0,0]) rotate([0,0,90]) diagonals(breadth, width, height, spacing, radius);
    rotate([0,0,90]) mirror([0,1,0]) diagonals(breadth, width, height, spacing, radius);

    translate([0,0,height-1]) cube([width,breadth,1]);
    cube([width,breadth,2]);
}

module diagonals(width, breadth, height, spacing, radius) {  
    depth = sqrt((height*height) + (height*height));
    intersection() {
        translate([-radius/2,-radius/2,0]) cube([width+radius*2, breadth+radius*2, height]);
        for (i = [0 : spacing : width]) {
            for (j = [spacing : spacing : breadth]) {
                translate([i,j,0]) rotate([45,0,0]) cylinder(depth, radius, radius);
            }
            for (j = [0: spacing: height]) {
                translate([i,breadth,j]) rotate([45,0,0]) cylinder(depth, radius, radius);
            }
        }
    }
}