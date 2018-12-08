//narrow_brick(height=3);

brick([2,3],2);

// src: https://bricks.stackexchange.com/questions/288/what-are-the-dimensions-of-a-lego-brick

lego = 1.6;

wall = 1 * lego;
toler = 1;

stud_diam = 3 * lego + .2 * toler;
stud_inner = 2 * lego + .2 * toler;
stud_height = 1 * lego;

duct_diam = 5 * sqrt(2) - 3 + 2.5 * toler; 
duct_inner = duct_diam - wall;

brick_one = 5 * lego;
inner_one = brick_one - (wall*2);

module brick(grid=[2,2], height=6) {
    if (grid[0] < grid[1]) brick([grid[1], grid[0]], height);
    else {
        if (grid[1] > 1) wide_brick(grid, height);
        else narrow_brick(grid[0], height);
        }
}

module wide_brick(grid=[2,2], height=6) {
    brick_sans_posts(grid, height);
    difference() {
        for (col = [1 : grid[1]-1]) for(row = [1:grid[0]-1]) color([0,1,1]) translate([brick_one*col,brick_one*row,0]) cylinder(d=duct_diam, lego*height-wall/2);
        for (col = [1 : grid[1]-1]) for(row = [1:grid[0]-1]) color([1,1,1]) translate([brick_one*col,brick_one*row,0]) cylinder(d=duct_inner, lego*height-wall/2);
        }
}

module narrow_brick(pegs=2, height=6, posts=true) {
    union() {
        brick_sans_posts([pegs, 1], height);
        if (posts && pegs>1) for (spot = [1 : pegs-1]) color([0,1,0]) translate([brick_one/2,brick_one*spot,0]) cylinder(d=stud_inner, lego*height);
        }
}

module brick_sans_posts(grid, height) {
    difference() {
        brick_sans_hollow(grid, height);
        color([0,0,1]) translate([wall,wall,0]) cube([inner_one+(grid[1]-1)*brick_one, inner_one+(grid[0]-1)*brick_one, lego*height - wall+toler/2]);
        for (col = [1 : grid[1]]) for(row = [1:grid[0]]) color([1,1,0]) translate([brick_one*(col-.5),brick_one*(row-.5),lego*height-wall*2]) cylinder(d=stud_inner, stud_height+wall*2);
        }
}

module brick_sans_hollow(grid, height) {
    union() {
        cube([brick_one*grid[1], brick_one*grid[0], lego*height]);
        for (col = [1 : grid[1]]) for(row = [1:grid[0]]) color([1,0,0]) translate([brick_one*(col-.5),brick_one*(row-.5),lego*height]) cylinder(d=stud_diam, stud_height);
        }
}