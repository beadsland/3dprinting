//narrow_brick(height=3);

brick([2,3],2);

// NOTE: The bricks described here are not perfectly fit to the tolerances of a
//             consumer injection-molded peg-and-socket brick. They snap tight to
//             one another, but not all that well to the consumer-grade bricks.

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

//
// API modules
///
function lego_unit() = lego;

function brick_unit() = brick_one;

function brick_height() = 6;

function plate_height() = 2;

module plate(grid=[3,2], pegs=true, hollow=true, posts=true) {
    brick(grid, plate_height(), pegs, hollow, posts);
}

module brick(grid=[2,1], height=brick_height(), pegs=true, hollow=true, posts=true) {
    if (grid[0] < grid[1]) translate([0, grid[0]*brick_one, 0]) rotate([0,0,-90]) brick([grid[1], grid[0]], height, pegs, hollow, posts);
    else {
        if (grid[1] > 1) wide_brick(grid, height, pegs, hollow);
        else narrow_brick(grid[0], height, pegs, hollow, posts);
        }
}

//
// Subroutine modules
//
module wide_brick(grid, height, pegs, hollow) {
    union() {
        brick_sans_posts(grid, height, pegs, hollow);
        difference() {
            for (col = [1 : grid[1]-1]) for(row = [1:grid[0]-1]) color([0,1,1]) translate([brick_one*col,brick_one*row,0]) cylinder(d=duct_diam, lego*height-wall/2);
            for (col = [1 : grid[1]-1]) for(row = [1:grid[0]-1]) color([1,1,1]) translate([brick_one*col,brick_one*row,0]) cylinder(d=duct_inner, lego*height-wall/2);
            }
    }
}

module narrow_brick(length, height, pegs, hollow, posts) {
    union() {
        brick_sans_posts([length, 1], height, pegs, hollow);
        if (posts && length>1) for (spot = [1 : length-1]) color([0,1,0]) translate([brick_one/2,brick_one*spot,0]) cylinder(d=stud_inner, lego*height);
        }
}

module brick_sans_posts(grid, height, pegs, hollow) {
    difference() {
        brick_sans_hollow(grid, height, pegs);
        color([0,0,1]) translate([wall,wall,0]) cube([inner_one+(grid[1]-1)*brick_one, inner_one+(grid[0]-1)*brick_one, lego*height - wall+toler/2]);
        if (pegs && hollow) for (col = [1 : grid[1]]) for(row = [1:grid[0]]) color([1,1,0]) translate([brick_one*(col-.5),brick_one*(row-.5),lego*height-wall*2]) cylinder(d=stud_inner, stud_height+wall*2);
        }
}

module brick_sans_hollow(grid, height, pegs) {
    union() {
        cube([brick_one*grid[1], brick_one*grid[0], lego*height]);
        if (pegs) for (col = [1 : grid[1]]) for(row = [1:grid[0]]) color([1,0,0]) translate([brick_one*(col-.5),brick_one*(row-.5),lego*height]) cylinder(d=stud_diam, stud_height);
        }
}
