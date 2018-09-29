include <solder_stuff_station.scad>;

outer_diameter = 50;
inner_diameter = 44;

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
          GreatBlock(10);
          translate([small_block_width, small_block_length, 0]) {
               globe(outer_diameter, 10);
          }
     }
     translate([small_block_width, small_block_length - 3, 3]) globe(inner_diameter, 12);
}

