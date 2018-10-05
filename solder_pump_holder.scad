include <solder_stuff_station.scad>;

module PumpHolder(pump_height=40, pump_width=25) {
     difference() {
          Block(height=pump_height + 3);
          translate([block_side_length/2, block_side_length/2, 3]) cylinder(h=pump_height, d=pump_width);
     }    
}

PumpHolder();
