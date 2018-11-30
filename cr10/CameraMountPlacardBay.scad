
translate([0,0,-100]) union() {
    difference() {
        import("vend/CR-10_CamHolder-Mount.stl");
        color([0,1,1]) translate([18,-10,90]) cube(20);
    }

    height = 25;
    depth = 5;
    width = height*2;
    wall = 5;

    translate([-37,0,24]) rotate([0,30,0]) difference() {
        color([1,0,1]) translate([8,-width/2,105-height]) resize([depth,width,height]) cube(height);

        color([1,1,0]) translate([8+depth/3,-(width-wall/2*2)/2,105-height]) resize([depth/3,width-wall/2*2,height-wall/2]) cube(height);
        
        color([1,0,0]) translate([8+depth/2,-(width-wall*2)/2,105-height]) resize([depth/2,width-wall*2,height-wall]) cube(height);
    }
}