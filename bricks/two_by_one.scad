lego = 1.6;

wall = 1 * lego;
toler = 1;

stud_diam = 3 * lego +.2 * toler;
stud_inner = 2 * lego +.2 * toler;
stud_height = 1 * lego;

brick_one = 5 * lego;
inner_one = brick_one - (wall*2);

narrow_brick(2,3);


module narrow_brick(pegs=2, height=3) {
    difference() {
        cube([brick_one, brick_one*pegs, lego*height]);
        color([0,0,1]) translate([wall,wall,0]) cube([inner_one, inner_one+(pegs-1)*brick_one, lego*height - wall*1.1]);
    }
    for (spot = [1 : pegs-1]) color([0,1,0]) translate([brick_one/2,brick_one*spot,0]) cylinder(d=stud_inner, lego*height);
    for (spot = [1 : pegs]) color([1,0,0]) translate([brick_one/2,brick_one*(spot-.5),lego*height]) cylinder(d=stud_diam, stud_height);
}
