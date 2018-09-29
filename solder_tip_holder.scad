include <solder_stuff_station.scad>;

module solderTipConnector() {     
     cylinder(h=15, d=5);
     translate([0, 0, 15]) cylinder(h=2, d=10);
}

module SolderTipHolder() {
     tip_distance = 8;
     difference() {
          SmallBlock(20);
          translate([tip_distance, tip_distance, 3]) solderTipConnector();
          translate([tip_distance, small_block_length - tip_distance, 3]) solderTipConnector();
          translate([small_block_width - tip_distance, tip_distance, 3]) solderTipConnector();
          translate([small_block_width - tip_distance, small_block_length - tip_distance, 3]) solderTipConnector();          
     }     
}

SolderTipHolder();
