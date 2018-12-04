lego = 1.6;

wall = 1 * lego;

stud_diam = 3 * lego;
stud_inner = 2 * lego;
stud_height = 1 * lego;

brick_one = 5 * lego;
inner_one = brick_one - (wall*2); 

difference() { 
    cube([brick_one, brick_one*2, lego*2]);
    color([0,0,1]) translate([wall,wall,0]) cube([inner_one, inner_one*2+lego*2, lego*2 - wall]);
}
color([1,0,0]) translate([lego*2.5,lego*2.5,lego*2]) cylinder(d=stud_diam, stud_height);
color([1,0,0]) translate([brick_one/2,brick_one*1.5,lego*2]) cylinder(d=stud_diam, stud_height);