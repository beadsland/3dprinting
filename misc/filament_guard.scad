linear_extrude(3) {
    difference() {

        union() {
            circle(40);
            translate([-40,0,0]) { square(80,80); }
        }
        
        circle(16.25);
        translate([-16.25,0,0]) { square(32.5,80); } 
        translate([-20,30,0]) { square(40,80); } 
    }
}