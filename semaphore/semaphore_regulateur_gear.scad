$fn = 100;

use <publicDomainGearV1.1.scad>;

// slack config for 3d printing
loose_slack = 0.3;
tight_slack = 0.1;

screw_diameter = 4;

n1 = 18; //red gear number of teeth
mm_per_tooth = 4;
thickness    = 6;
hole         = 3;
height       = 12;

gt2PulleyThickness = 7.5;

bridge_length = 6.5;
bridge_diameter = 10;

module 18teethGear() {
    translate([0, 0, thickness/2])
        color([1.00,0.75,0.75]) 
            gear(mm_per_tooth,n1,thickness,hole);
}

difference() {
    union() {
        18teethGear();

        // Bridge
        cylinder(d=bridge_diameter, h=thickness + bridge_length);
    }

    translate([0, 0, -1]) {
        cylinder(d=screw_diameter + loose_slack, h=thickness + bridge_length + gt2PulleyThickness + 2);
    }
    
    translate([0, 0, bearing_hold_height])
        cylinder(d=bearing_diameter + 2 * tight_slack, h=thickness + bridge_length + gt2PulleyThickness + 2);
    
    
    
}