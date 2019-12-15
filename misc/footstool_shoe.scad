arc_w = 107;
arc_h = 17;

radius = (arc_h / 2) + (arc_w * arc_w) / (8 * arc_h);
angle = -10;

pod = 40;
under = 10;
sole = 2;
well = 15;
wall = 2;
toe = 5;
heel = 15;

foot = 43 + wall*2;

translate([40,0,0]) mirror() shoe();
translate([-40,0,0]) shoe();

module shoe() {
    difference() {
        union () {
            difference () {      
                rotate([0, angle, 0]) {
                    translate([0, 0, -well]) { linear_extrude(well) { arc(radius, wall*2+toe, 80); } }
                }
                rotate([0, angle, 0]) {
                    translate([wall, 0, sole-well]) { linear_extrude(well) { arc(radius, toe, 90); } }
                }
                
                translate([pod-20, 0, -under]) { linear_extrude(under) { circle(90, 0, 0); } }
            }
            
            translate([pod-20, 0, 0]) { linear_extrude(sole) { circle(90, 0, 0); } }
        }
        translate([0, 0, -1]) { linear_extrude(sole+2) { circle(90, 0, 0); } }
        translate([0,-pod*3,-1]) { cube([pod*2,pod*6,sole+1]); }
    }

    rotate([0,0,10]) {
        translate([pod+foot/2+arc_h-heel+toe, 0, 0]) {
            difference() {
                linear_extrude(well/2) { circle(foot/2); }
                translate([0, 0, sole]) { linear_extrude(well) { circle(foot/2-wall); } }
            }
        }
    }

    translate([pod*2, 0, 0]) { linear_extrude(sole) { scale([.6, 1.7]) { circle(pod); } } }
}


module arc(radius, thick, angle){
	intersection(){
		union(){
			rights = floor(angle/90);
			remain = angle-rights*90;
			if(angle > 90){
				for(i = [0:rights-1]){
					rotate(i*90-(rights-1)*90/2){
						polygon([[0, 0], [radius+thick, (radius+thick)*tan(90/2)], [radius+thick, -(radius+thick)*tan(90/2)]]);
					}
				}
				rotate(-(rights)*90/2)
					polygon([[0, 0], [radius+thick, 0], [radius+thick, -(radius+thick)*tan(remain/2)]]);
				rotate((rights)*90/2)
					polygon([[0, 0], [radius+thick, (radius+thick)*tan(remain/2)], [radius+thick, 0]]);
			}else{
				polygon([[0, 0], [radius+thick, (radius+thick)*tan(angle/2)], [radius+thick, -(radius+thick)*tan(angle/2)]]);
			}
		}
		difference(){
			circle(radius+thick);
			circle(radius);
		}
	}
}



