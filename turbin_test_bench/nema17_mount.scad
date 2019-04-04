$fn=100;

mode = 1; // 3D
//mode = 2; // 2D

gap = 3;

// Lasercut slack
//loose_slack = 0;
//tight_slack = -0.1;

// 3D print slack
loose_slack = 0.3;
tight_slack = 0.1;

mount_thickness = 5;
mount_fixation_hole_diameter = 9;

mount_width = 90;
mount_height = 90;

belt_axe_to_axe_length = 450;

nema_width = 42.3;
nema_height = 42.3;
nema_shaft_diameter = 28;
nema_fixation_center_to_center_length = 31;
nema_fixation_hole_diameter = 3;

// calculated
nema_hole_to_border_length = (nema_width - nema_fixation_center_to_center_length) / 2;

module nema17_spacer() {
    difference() {
        union() {
            // Front holder
            translate([-mount_width/2, -mount_height/2, 0])
                cube([mount_width, mount_height, mount_thickness]);
        }
        
        translate([0, 0, -1]) {
            // Shaft hole
            cylinder(d=nema_shaft_diameter, h=2*mount_thickness+2);
        
            // Nema fixation holes
            for (angle = [0 : 90 : 360]) {
                rotate([0, 0, angle])
                    translate([- nema_fixation_center_to_center_length/2, - nema_fixation_center_to_center_length/2, 0]) {
                        nema17_fixation_hole();
                    
                    }
               
            }
            
            // Base fixation windows
            for (angle = [0 : 90 : 360]) {
                rotate([0, 0, angle])
                    hull() {
                        translate([(mount_width + nema_width)/4 - 5, (mount_height + nema_height)/4, 0]) 
                            cylinder(d=mount_fixation_hole_diameter, h=2*mount_thickness+2);
                        translate([0, (mount_height + nema_height)/4, 0]) 
                            cylinder(d=mount_fixation_hole_diameter, h=2*mount_thickness+2);
                    }
            }
            
        }
    }
}

module nema17_fixation_hole() {
    cylinder(d=nema_fixation_hole_diameter+2*loose_slack, h=mount_thickness+2);
}

module base_fixation_hole(length = 10) {
    hull() {
        translate([0, mount_fixation_hole_diameter/2, -1]) {
            cylinder(d=mount_fixation_hole_diameter + 2*loose_slack, h=mount_height+2);
        
            translate([0, length - mount_fixation_hole_diameter, 0])
                cylinder(d=mount_fixation_hole_diameter + 2*loose_slack, h=mount_height+2);
        }
    }
}


module mount_3D() {
    nema17_spacer();
}

if (mode == 1) {
    mount_3D();
}

if (mode == 2) {
    projection() {
        mount_3D();
    }
}