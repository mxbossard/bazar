$fn = 200;

gap = 2;

regulateur_length = 276;
regulateur_width = 21;
regulateur_thickness = 5;

indicateur_length = 120;
indicateur_width = 18;
indicateur_thickness = 5;

bearing_diameter = 13;
bearing_hold_diameter = bearing_diameter - 2;
bearing_width = 5;

screw_diameter = 5;
driving_hole_diameter = 3.2;
driving_hole_pitch = 7;
mark_hole_diameter = 1;

module regulateur_3d() {
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

module regulateur_2d() {
    difference() {
        // Body
        union() {
            translate([regulateur_width/2, 0])
                square([regulateur_length - regulateur_width,regulateur_width]);
            
            translate([regulateur_width/2, regulateur_width/2])
                circle(d=regulateur_width);
            
            translate([regulateur_length -regulateur_width/2, regulateur_width/2]) 
                circle(d=regulateur_width);

        }

        // Right hole
        translate([regulateur_width/2,regulateur_width/2]) {
            // Need CNC
            circle(d=mark_hole_diameter);
        }
        
        // Left hole
        translate([regulateur_length - regulateur_width/2,regulateur_width/2]) {
            // Need CNC
            circle(d=mark_hole_diameter);
        }
        
        // Center hole
        translate([regulateur_length/2,regulateur_width/2]) {
            circle(d=screw_diameter);
            transmission_holes_2d();
        }
    }
}

module regulateur_end_2d() {
    // Piece at which encapsulate a bearing at each end of the regulator.
    
    difference() {
        union() {
            translate([regulateur_width/2, regulateur_width/2])
                circle(d=regulateur_width);
            
            translate([regulateur_width/2, 0])
                square([regulateur_width,regulateur_width]);
        }
        
        translate([regulateur_width/2, regulateur_width/2])
            // Need CNC
            circle(d=mark_hole_diameter);
    }
        
}

module indicateur_3d() {
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

module indicateur_2d() {
    difference() {
        // Body
        union() {
            translate([indicateur_width/2, 0])
               square([indicateur_length - indicateur_width/2,indicateur_width]);
                    
            translate([indicateur_width/2, indicateur_width/2])
               circle(d=indicateur_width);
        }
    
        translate([indicateur_width/2, indicateur_width/2]) {
            // Need CNC
            circle(d=mark_hole_diameter);
            transmission_holes_2d();
        }
    }

}

module transmission_holes_2d() {
    translate([driving_hole_pitch,0])
        circle(d=driving_hole_diameter);
    translate([-driving_hole_pitch,0])
        circle(d=driving_hole_diameter);
}

/*
translate([0,1*(gap + regulateur_width),0])
    regulateur_3d();

translate([0,0*(gap + regulateur_width),0])
    indicateur_3d();

translate([gap + indicateur_length,0*(gap + regulateur_width),0])
    indicateur_3d();
*/

regulateur_end_2d();
translate([gap + 3/2* regulateur_width, 0])
    regulateur_end_2d();

translate([0, gap + regulateur_width]) {

    indicateur_2d();
    translate([gap + indicateur_length, 0])
        indicateur_2d();

    translate([0,gap + indicateur_width])
        regulateur_2d();

}
   

