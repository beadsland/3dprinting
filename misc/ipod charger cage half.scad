width = 6.97;
breadth = 25.95;
depth = 16.09;

join = 5.09;
join_len = 3.39;

button = 3.79;
wall = 3;

difference() {
    cube([depth+join_len+wall*2,breadth+wall*2,width/2+wall]);
    translate([0,wall,0]) cube([depth,breadth,width/2]);
}