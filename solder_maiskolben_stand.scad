use <solder_stuff_station.scad>;

stand_width = 2.5;
module stand() {
     translate([stand_width, 60, 60]) {
          rotate([0, 90, 180]) {
               linear_extrude(stand_width) {
                    difference() {
                         polygon([[0,0], [60,0], [60,60]]);
                         polygon([[12.5,5], [55,5], [55,47.5]]);
                    }
                    //rotate([0,0,45]) square([20,3]);
                    translate([-3,3,0]) {
                         rotate([0,0, 315]) {        
                              translate([0, 10]) square([5,19]);
                              translate([0, 55]) square([5,19]);
                         }
                    }
               }
          }
     }
}


difference() {
     Block(4, 2);
     translate([80, 10, 3]) cube([30, 40, 7]);
     translate([10 - stand_width, -1, 3]) cube([stand_width, BlockLength(2) + 2, 8]);
     translate([62, -1, 3]) cube([stand_width, BlockLength(2) + 2, 8]);
}


