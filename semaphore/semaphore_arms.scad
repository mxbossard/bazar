$fn = 200;

gap = 2;

regulateur_length = 276;
regulateur_width = 21;
regulateur_thickness = 5;

indicateur_length = 120;
indicateur_width = 18;
indicateur_thickness = 5;

bearing_diameter = 13;
bearing_hold_diameter = 11;
bearing_width = 5;

screw_diameter = 4;
transmision_hole_diameter = 2;

module regulateur() {
    difference() {
        union() {
            translate([regulateur_width/2, 0, 0])
                cube([regulateur_length - regulateur_width,regulateur_width,regulateur_thickness]);
            
            translate([regulateur_width/2, regulateur_width/2, 0])
                cylinder(d=regulateur_width, h=regulateur_thickness);
            
            translate([regulateur_length -regulateur_width/2, regulateur_width/2, 0]) 
                cylinder(d=regulateur_width, h=regulateur_thickness);

        }

        translate([regulateur_width/2,regulateur_width/2,-1]) {
            cylinder(d=bearing_hold_diameter, h=regulateur_thickness+2);
            cylinder(d=bearing_diameter, h=bearing_width/2+1);
        }
        
        translate([regulateur_length - regulateur_width/2,regulateur_width/2,-1]) {
            cylinder(d=bearing_hold_diameter, h=regulateur_thickness+2);
            cylinder(d=bearing_diameter, h=bearing_width/2+1);
        }
        
        translate([regulateur_length/2,regulateur_width/2,-1])
            cylinder(d=screw_diameter, h=regulateur_thickness+2);
    }
}

module indicateur() {
    difference() {
        union() {
            translate([indicateur_width/2, 0, 0])
                cube([indicateur_length - indicateur_width/2,indicateur_width,indicateur_thickness]);
            
            translate([indicateur_width/2, indicateur_width/2, 0])
                cylinder(d=indicateur_width, h=indicateur_thickness);
        }
    
        translate([indicateur_width/2, indicateur_width/2, -1])
            cylinder(d=screw_diameter, h=indicateur_thickness+2);
    }
}

translate([0,1*(gap + regulateur_width),0])
    regulateur();

translate([0,0*(gap + regulateur_width),0])
    indicateur();

translate([gap + indicateur_length,0*(gap + regulateur_width),0])
    indicateur();