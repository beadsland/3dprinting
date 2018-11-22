give = .35;
coin_d1 = 26.4 + give; // 24.1
coin_d2 = 26.6 + give;
coin_q3 = 24.15 + give;
coin_r1 = coin_d1 / 2;
coin_r2 = coin_d2 / 2;
coin_r3 = coin_q3 / 2;
coin_h	=	2;

back_h = .35;
buffer	=	0.75;
wall = 2;

card_w	=	(3 * coin_d2) + (5 * buffer);	//86
card_l	=	(coin_d1 + coin_d2) + (3 * buffer);
//card_l = 54;
card_h	=	coin_h + back_h;	//3

//card_w  = coin_d2 + (2 * buffer) + (2 * wall);
test_l = card_w;

translate([0, -card_l-wall, 0]) {
    difference() {
        cube([card_w, card_l, card_h * 2]);

        translate([buffer*2, buffer*2, card_h]) {
            cube([card_w - (buffer*4), card_l - (buffer*4), card_h+1]);
        }
 
        translate([0-buffer/2, card_l /2 - 5, card_h]) {
            cube([wall * 2, 10, card_h+1]);
        }
        translate([card_w-wall+buffer/2, card_l /2 - 5, card_h]) {
            cube([wall * 2, 10, card_h+1]);
        }

        translate([(card_w/2-wall*2+buffer)-card_w/4, 0-.1, card_h]) {
            cube([10, wall * 2, card_h+1]);
        }
        translate([(card_w/2-wall*2+buffer)+card_w/4, 0-.1, card_h]) {
            cube([10, wall * 2, card_h+1]);
        }
        translate([(card_w/2-wall*2+buffer)-card_w/4, card_l-wall-.1, card_h]) {
            cube([10, wall * 2, card_h+1]);
        }
        translate([(card_w/2-wall*2+buffer)+card_w/4, card_l-wall-.1, card_h]) {
            cube([10, wall * 2, card_h+1]);
        }
        
        translate([coin_r3+wall+card_l/2, card_l-coin_r3-buffer*3, -.01]){
            cylinder(r1=coin_r3-0.1, r2=coin_r3+0.05, h=4);
        }
       translate([coin_r3+wall+card_l/2, coin_r3+buffer*3, -.01]){
            cylinder(r1=coin_r3-0.1, r2=coin_r3+0.05, h=4);
        }
        
        translate([coin_r3+wall+buffer*2, card_l-coin_r3-buffer*3, -.01]){
            cylinder(r1=coin_r3-0.1, r2=coin_r3+0.05, h=4);
        }
       translate([coin_r3+wall+buffer*2, coin_r3+buffer*3, -.01]){
            cylinder(r1=coin_r3-0.1, r2=coin_r3+0.05, h=4);
        }

        translate([coin_r3+card_l+buffer, card_l-coin_r3-buffer*3, -.01]){
            cylinder(r1=coin_r3-0.1, r2=coin_r3+0.05, h=4);
        }
       translate([coin_r3+card_l+buffer, coin_r3+buffer*3, -.01]){
            cylinder(r1=coin_r3-0.1, r2=coin_r3+0.05, h=4);
        }

    }
}


color([1,1,0]) {
    translate([wall, wall*2, 0]) {
        difference() {
            union() {
                cube([card_w-wall*2, card_l - wall*2, card_h]);

                translate([-wall,(card_l-wall*2)/2-(5-give/2),0]) {
                    cube([wall, 10-give, card_h-1]);
                }
                translate([card_w-wall*2,(card_l-wall*2)/2-(5-give/2),0]) {
                    cube([wall, 10-give, card_h-1]);
                }

                translate([(card_w/2-wall*3+buffer+give/2)-card_w/4, -wall, 0]) {
                    cube([10-give, wall, card_h-1]);
                }
                 translate([(card_w/2-wall*3+buffer+give/2)-card_w/4, card_l-wall*2, 0]) {
                    cube([10-give, wall, card_h-1]);
                }
                translate([(card_w/2-wall*3+buffer+give/2)+card_w/4, -wall, 0]) {
                    cube([10-give, wall, card_h-1]);
                }
                 translate([(card_w/2-wall*3+buffer+give/2)+card_w/4, card_l-wall*2, 0]) {
                    cube([10-give, wall, card_h-1]);
                }
            }

            translate([coin_r2+buffer*4, card_l-coin_r2-wall*2-buffer*4, back_h]) {
                cylinder(r1=coin_r2-0.1, r2=coin_r2+0.05, h=4);
                translate([0,0,-.5]) {
                    cylinder(r1=coin_r3-give,r2=coin_r3-give,h=1);
                }
            }  
            translate([card_w-wall*2-coin_r2-buffer*4, card_l-coin_r2-wall*2-buffer*4, back_h]) {
                cylinder(r1=coin_r2-0.1, r2=coin_r2+0.05, h=4);
                translate([0,0,-.5]) {
                    cylinder(r1=coin_r3-give,r2=coin_r3-give,h=1);
                }
            }  
            translate([card_w/2-wall, coin_r2+buffer*4, back_h]) {
                cylinder(r1=coin_r2-0.1, r2=coin_r2+0.05, h=4);
                translate([0,0,-.5]) {
                    cylinder(r1=coin_r3-give,r2=coin_r3-give,h=1);
                }
            }  
        }
    }
}