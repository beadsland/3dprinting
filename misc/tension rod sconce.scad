narrow = 12.83;
wide = 15.87;
depth = 15.88;

butt_dep = 3.58;
butt_narr = 13.48;

wall=3;
height = 30.03;
back = butt_dep + 1.5;

rotate([0,-90,0]) {
    intersection() {
        difference() {
            union() {
                cube([depth-.01, wide+wall*2,wide*.7]);
                translate([-back, 0, 0]) cube([back, wide+wall*2, height]);
            }
            translate([0, wide/2+wall, wide/2*1.3]) rotate([180,-90,0]) cylinder(depth, d1=wide, d2=narrow, 0);
            
                 translate([0, wide/2+wall,wide/2*1.3]) rotate([180, 90, 0]) color([0.3,0.3,0.3]) cylinder(butt_dep, d1=wide,d2=butt_narr, 0);     
    
            }

        translate([wide/2-wall,wide/2+wall,wide/2+wall*2.5]) color([0,1,1,]) sphere(r=wide+wall/1.5);
    }
}

