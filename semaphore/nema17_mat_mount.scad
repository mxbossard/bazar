$fn=100;

base_mode = 1; // Base fixation is inside the mount
//base_mode = 2; // Base fixation is outside the mount


loose_slack = 0.3;
tight_slack = 0.1;

mount_thickness = 5;
mount_fixation_hole_diameter = 4;
mount_fixation_hole_border = 5;
mount_inter_space = 2*mount_thickness;

mat_width = 25;
mat_width_slack = 5;

belt_axe_to_axe_length = 450;

nema_width = 42.3;
nema_height = 42.3;
nema_shaft_diameter = 30;
nema_fixation_center_to_center_length = 31;
nema_fixation_hole_diameter = 3;

// calculated
mount_height = nema_height;
nema_hole_to_border_length = (nema_width - nema_fixation_center_to_center_length) / 2;
mount_width = nema_width + mount_inter_space + mat_width + mat_width_slack + 2*mount_fixation_hole_diameter + 2*mount_fixation_hole_border;
mat_middle_x = nema_width + mount_inter_space + mat_width/2 + mount_fixation_hole_diameter + mount_fixation_hole_border;

module nema17_mount() {
    difference() {
        union() {
            // Front holder
            cube([mount_width, mount_height, mount_thickness]);
            
            // Enforcement border
            translate([-mount_thickness, -mount_thickness, 0])
                cube([mount_width + 2*mount_thickness, mount_thickness, 2*mount_thickness]);
            translate([-mount_thickness, -mount_thickness, 0])
                cube([mount_thickness, mount_height + 2*mount_thickness, 2*mount_thickness]);
            translate([-mount_thickness, mount_height, 0])
                cube([mount_width + 2*mount_thickness, mount_thickness, 2*mount_thickness]);
            translate([mount_width, -mount_thickness, 0])
                cube([mount_thickness, mount_height + 2*mount_thickness, 2*mount_thickness]);
            
        }

        // Shaft hole
        hull() {
            translate([nema_width/2, nema_height/2, -1])
                cylinder(d=nema_shaft_diameter, h=2*mount_thickness+2);
            
            translate([mount_width + mat_middle_x - 2*mat_width_slack, mount_height/2 + belt_axe_to_axe_length, -1])
                cylinder(d=nema_shaft_diameter, h=2*mount_thickness+2);
            
            translate([mount_width + mat_middle_x + 4*mat_width_slack, mount_height/2 + belt_axe_to_axe_length, -1])
                cylinder(d=nema_shaft_diameter, h=2*mount_thickness+2);
        }
        
        // Nema fixation holes
        translate([nema_width/2 - nema_fixation_center_to_center_length/2, mount_height - nema_hole_to_border_length, -1]) {
            nema17_fixation_hole();
            translate([0, -nema_fixation_center_to_center_length, 0])
                nema17_fixation_hole();
            translate([nema_fixation_center_to_center_length, 0, 0])
                nema17_fixation_hole();
            translate([nema_fixation_center_to_center_length, -nema_fixation_center_to_center_length, 0])
                nema17_fixation_hole();
        }
        
        // Mount fixation holes
        translate([nema_width + mount_inter_space + mount_fixation_hole_border + mount_fixation_hole_diameter/2, mount_fixation_hole_border + mount_fixation_hole_diameter/2, -1])
            cylinder(d=mount_fixation_hole_diameter, h=2*mount_thickness+2);
        
        translate([nema_width + mount_inter_space + mount_fixation_hole_border + mount_fixation_hole_diameter/2, nema_height - mount_fixation_hole_border - mount_fixation_hole_diameter/2, -1])
            cylinder(d=mount_fixation_hole_diameter, h=2*mount_thickness+2);
        
        translate([mount_width - mount_fixation_hole_border - mount_fixation_hole_diameter/2, mount_fixation_hole_border + mount_fixation_hole_diameter/2, -1])
            cylinder(d=mount_fixation_hole_diameter, h=2*mount_thickness+2);
        
        translate([mount_width - mount_fixation_hole_border - mount_fixation_hole_diameter/2, nema_height - mount_fixation_hole_border - mount_fixation_hole_diameter/2, -1])
            cylinder(d=mount_fixation_hole_diameter, h=2*mount_thickness+2);
        
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


nema17_mount();

translate([153, -60, 0])
    mirror([1,0,0])
        nema17_mount();