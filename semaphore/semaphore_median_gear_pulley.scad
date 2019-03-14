$fn = 100;

use <publicDomainGearV1.1.scad>;

// slack config for 3d printing
loose_slack = 0.3;
tight_slack = 0.1;

bearing_diameter = 13;
bearing_hold_diameter = bearing_diameter - 2;
bearing_embedment = 5;

n1 = 35; //red gear number of teeth
mm_per_tooth = 4;
thickness    = 6;
hole         = 3;
height       = 12;

gt2Pulley_Thickness = 7.5;

module 35teethGear() {
    translate([0, 0, thickness/2])
        color([1.00,0.75,0.75]) 
            gear(mm_per_tooth,n1,thickness,hole);
}

module 28teethGt2Pulley() {
    include <./gt2_pulley_28_teeth.scad>;
}

module clean28teethGt2Pulley() {
    translate([0, 0, 0.5])
        28teethGt2Pulley();
}


difference() {
    union() {
        35teethGear();

        translate([0, 0, thickness])
            clean28teethGt2Pulley();
    }

    translate([0, 0, -1]) {
        cylinder(d=bearing_diameter + 2*tight_slack, h=bearing_embedment + 1 +  + loose_slack);
        cylinder(d=bearing_hold_diameter, h= thickness + gt2Pulley_Thickness + 2);
    }
    
    translate([0, 0, thickness + gt2Pulley_Thickness - bearing_embedment])
        cylinder(d=bearing_diameter + 2*tight_slack, h=bearing_embedment + tight_slack + 1);
    
    
    
}