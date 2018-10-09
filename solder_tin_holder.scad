include <solder_stuff_station.scad>;

module solderTinHolderSide() {
     rotate([90, 0, 90]) {
          linear_extrude(2) {
               translate([0, 15]) {
                    difference() {
                         polygon([[0, 0], [block_side_length * 2, 0], [(block_side_length * 2) - 20, 20], [20, 20]]);
                         translate([block_side_length, 17]) circle(d=18, center=true);
                    }
               }
               square([block_side_length * 2, 15]);
          }
     }
}

module SolderTinHolder() {
     difference() {
          GreatBlock(10);
          translate([10, 3, 3]) cube([40, (block_side_length * 2) - 6, 8]);
     } 

     translate([8, 0, 10]) solderTinHolderSide();
     translate([(block_side_length * 2) - 10, 0, 10]) solderTinHolderSide();

     translate([block_side_length, 2, 8]) {
          rotate([90, 0, 0]) {
               difference() {
                    hull() {
                         cylinder(h=2, d=6);
                         translate([0, 6, 0]) cylinder(h=2, d=6);
                    }
                    translate([0, 5, 0]) cylinder(h=2, d=3.5);
               }
          }
     }
}
SolderTinHolder();
