//narrow_brick(height=3);

narrow_brick(1);

// src: https://bricks.stackexchange.com/questions/288/what-are-the-dimensions-of-a-lego-brick

lego = 1.6;

wall = 1 * lego;
toler = 1;

stud_diam = 3 * lego +.2 * toler;
stud_inner = 2 * lego +.2 * toler;
stud_height = 1 * lego;

brick_one = 5 * lego;
inner_one = brick_one - (wall*2);

module narrow_brick(pegs=2, height=6, posts=true) {
    union() {
        narrow_sans_posts(pegs, height);
        if (posts && pegs>1) for (spot = [1 : pegs-1]) color([0,1,0]) translate([brick_one/2,brick_one*spot,0]) cylinder(d=stud_inner, lego*height);
    }
}

module narrow_sans_posts(pegs, height) {
    difference() {
        narrow_sans_hollow(pegs, height);
        color([0,0,1]) translate([wall,wall,0]) cube([inner_one, inner_one+(pegs-1)*brick_one, lego*height - wall+toler]);
        for (spot = [1 : pegs]) color([1,1,0]) translate([brick_one/2,brick_one*(spot-.5),lego*height-wall*2]) cylinder(d=stud_inner, stud_height+wall*2);
    }    
}

module narrow_sans_hollow(pegs, height) {
   union() {
        cube([brick_one, brick_one*pegs, lego*height]);
        for (spot = [1 : pegs]) color([1,0,0]) translate([brick_one/2,brick_one*(spot-.5),lego*height]) cylinder(d=stud_diam, stud_height);
    }
}
    