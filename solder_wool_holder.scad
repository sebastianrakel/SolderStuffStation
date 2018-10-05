include <solder_stuff_station.scad>;

outer_diameter = block_side_length * 3 - 10;
inner_diameter = block_side_length * 3 - 16;

module globe(diameter, sockel_height=10) {
     hull() {
               cylinder(h=sockel_height, d=diameter);

               translate([0, 0, ((diameter/2) * -1) + sockel_height]) {
                    difference() {
                         translate([0, 0, diameter/2]) sphere(d=diameter);
                         cylinder(h=diameter/2, d=diameter);
                    }
               }
     }
}

difference() {
     union() {
          Block(3, 3, 10);
          translate([block_side_length * 1.5, block_side_length  * 1.5, 0]) {
               globe(outer_diameter, 10);
          }
     }
     translate([block_side_length * 1.5, block_side_length  * 1.5 - 3, 3]) globe(inner_diameter, 12);
}

