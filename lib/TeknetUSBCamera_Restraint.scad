use <../lib/lego.scad>;

plank([0,0,0], [2,8]);
plank([0,4,0], [2,8]);

plank([-1,-1,2], [8,4]);

riser([-1,-1,4], [2,4]);
riser([-1,5,4], [2,4]);

riser([0,-1,10], [8,2]);
riser([0,-1,16], [8,2]);

riser([0,-2,22], [4,2]);
riser([0,4,22], [4,2]);

module plank(pos=[0,0,0], dims=[1,1]) {
    translate([pos[0]*brick_unit(), pos[1]*brick_unit(), pos[2]*lego_unit()]) brick(dims, 2, pegs=false);
}

module riser(pos=[0,0,0], dims=[1,1], h=brick_height()) {
    translate([pos[0]*brick_unit(), pos[1]*brick_unit(), pos[2]*lego_unit()]) brick(dims, h, pegs=false);
}