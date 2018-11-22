//use <sweep.scad>;

diam = 3.25;
tine = 1.31;
arm = 29; //27.75;

gird = 5.25;

rotate([90,180,]) difference() {
    union() {
        rotate([-2,0,0]) resize([diam+0.5,6,arm*1.35]) translate([0,-1.2,1]) raindrop3D(diam,true);
        cylinder(arm-1,diam/2,diam/2,false);
        intersection() { 
            cylinder(arm,diam/2,diam/2,false);        
           translate([0,0, arm-1]) sphere(diam/2);
        }
        
        translate([0,0,arm-2]) color([1,0,0]) rotate([30,0,0]) cylinder(5,diam/2,gird/2,false);
        sphere(diam/2);

    }
    cylinder(arm+5,tine/2,tine/2,false);
    translate([0,0,arm]) cylinder(arm+5,diam/2,diam/2,false);
    translate([0,0,arm]) rotate([30,0,0]) cylinder(arm+5,diam/2,diam/2,false);

    translate([-5,0,arm]) cube(10,10,10);
}

//shape_points = square(10);
//path_transforms1 = [for (i=[0:pathstep:height]) let(t=i/height) translation([func1(t),func1(t),i]) * rotation([0,0,func4(t)])];
//sweep(shape_points, path_transforms1);


/*
Creates either a 2 dimensional raindrop shape that can be extruded, or a 3 dimensional raindrop shape.

Module raindrop2D creates a 2 dimensional raindrop shape.
parameters:
	thick		height of the extrusion
	radius		radius of the circle on the bottom of the raindrop shape
	centered	boolean value. sets the bottom circle as centered (true) on [0, 0, 0],
				or sets the entire object in the positive [x, y, z] quadrant
				
Module raindrop3D creates a 2 dimensional raindrop shape.
parameters:
	radius		radius of the sphere on the bottom of the raindrop shape
	centered	boolean value. sets the bottom sphere as centered (true) on [0, 0, 0],
				or sets the entire object in the positive [x, y, z] quadrant
*/

//example();

module raindrop2D(thick, radius, centered = true){
	if(!centered){
		translate([radius, radius, 0]){
			cylinder(h = thick, r = radius);
			linear_extrude(height = thick)
			polygon(points=[[radius * -cos(20), radius * sin(20)],[radius * cos(20), radius * sin(20)],[0, radius * 3]], paths=[[0,1,2]]);
		}
	}else if(centered){
		cylinder(h = thick, r = radius);
		linear_extrude(height = thick)
		polygon(points=[[radius * -cos(20), radius * sin(20)],[radius * cos(20), radius * sin(20)],[0, radius * 3]], paths=[[0,1,2]]);
	}	
}//end of module raindrop2D

module raindrop3D(radius, centered = true){
	if(!centered){
		translate([radius, radius, radius]){
			sphere(radius);
			translate([0, 0, radius * sin(20)]) cylinder(h = radius*3, r1 = radius * cos(20), r2 = 0);
		}
	}else if(centered){
		sphere(radius);
		translate([0, 0, radius*sin(20)]) cylinder(h = radius*3, r1 = radius * cos(20), r2 = 0);
	}	
}//end of module raindrop3D

module example(){
	raindrop2D(10, 10, false);
	translate([30, 0, 0]) raindrop3D(10, false);
}//end of module example