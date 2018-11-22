breadth = 100;
depth = 20;

height = breadth;
wall = 2;
slope = 4.3987;

notch = wall/4;
slot = wall;
slath = height/3;
thin = 0.8;
give = .4;

buttspan = .1875 * breadth * 4;
butttail = 1.4 * depth * 2;
buttslope = 1.27*45;

*union() {
    cube([breadth,depth,wall]);

    
difference() {
union() {
    translate([wall,0,0]) rotate([slope,0,0]) cube([breadth-(wall-notch)*2,slot,slath]);
    
    translate([wall,wall*2,0]) rotate([slope,0,0]) cube([breadth-(wall-notch)*2,thin,slath]);
    }

    translate([0,-wall*2,wall*2]) translate([wall*2,0,0]) rotate([slope,0,0]) color([0.7,0.3,0.3]) cube([breadth-(wall-notch)*5,wall*5,slath-wall]);
}
    
    

difference() {
union() {
    translate([wall,depth-wall,0]) rotate([slope,0,0]) cube([breadth-(wall-notch)*2,slot,slath]);
    
    translate([wall,depth-wall*2-thin,0]) rotate([slope,0,0]) cube([breadth-(wall-notch)*2,thin,slath]);   
    
    }
    
    translate([0,-wall*2,wall*2]) translate([wall*2,depth-wall,0]) rotate([slope,0,0]) color([0.7,0.3,0.3]) cube([breadth-(wall-notch)*5,wall*3,slath-wall]);
}

        
    
difference() {
    union() { 

        rotate([slope,0,0]) cube([wall,depth,height]);
        translate([breadth-wall,0,0]) rotate([slope,0,0]) cube([wall,depth,height]);

        translate([breadth/2-buttspan/4,butttail/3,-butttail*sqrt(2)/2]) rotate([buttslope,0,0]) color([1,0,0]) cube([buttspan/2,butttail,butttail]);
    }
    
        translate([breadth/2-buttspan/2,wall,-wall*2]) color([0,.5,.5]) rotate([slope,0,0]) cube(buttspan, butttail, butttail);
   
        translate([breadth/2-buttspan/2,-buttspan/1.25,-buttspan*1.5]) color([0,.5,.5]) cube([buttspan, buttspan*1.5,buttspan*1.5]);
    
    translate([wall-notch,wall,wall-notch]) color([0,0,1]) rotate([slope,0,0]) cube([breadth-(wall-notch)*2,slot,height]);
    
    translate([wall-notch,depth-wall*2,wall-notch]) color([0,0,1]) rotate([slope,0,0]) cube([breadth-(wall-notch)*2,slot,height]);
}

}

length = breadth-(wall-notch+give)*2;

translate([breadth*1.5,height*2,0]) { 

//sten = "";
sten = "hack_tower.png";
stenw = 202;
stenh = 580;
tower = length/stenw*stenh;
scale = tower/stenh*.90;
grays = 1/256;
hollow = wall-1.5;
gutter = 9;
    
echo(hollow);


    union()    {
    difference() {
union() {
    rotate([90,0,0]) color([0,1,0]) cube([length,slot-give,tower-gutter]);

   * rotate([90,0,0]) color([0,0,1]) cube([breadth,slot-give,height]);
}

    translate([breadth-breadth*.95,-tower*.95+gutter,wall-hollow+1]) scale([scale,scale,grays*wall*slot*2]) surface(file=sten, invert=true); 
    }
    
    *for(i = [20+gutter:26:tower*.9]) {
    translate([i<tower*.6?0:length*.3,i-tower,0]) color([.5,0,.5]) cube([i<tower*.6?length:(length*.4), thin, thin]);
    }
    
    *translate([0,35-tower,0]) color([.5,0,.5]) cube([length, thin, thin]);
    
    *translate([length/2+.5,-tower*.341+gutter+1,0]) color([.5,0,.5]) cube([thin,15,thin]);
}
}


*render() {
translate([0,depth*4,0]) { 

sten = "test.png";
stenw = 400;
stenh = 400;
scale = slath/stenh*.9;
grays = 1/256;
hollow = wall-1.5;
echo(hollow);

    difference() {
        rotate([90,0,0]) color([0,1,0]) cube([length,slot-give,slath]);

        translate([length/2-stenh*scale/2,-slath*.95,wall-hollow+1]) scale([scale,scale,grays*wall*slot*2]) surface(file=sten, invert=true); 
    }
}
}

