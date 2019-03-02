$fn=100;

loose_slack = 0.3;
tight_slack = 0.1;

mat_width = 30;
mat_thickness = 5;
mat_fixation_hole_diameter = 4;
mat_base_fixation_hole_diameter = 8;

mat_holder_thickness = 8;
mat_holder_width = 80;
mat_holder_depth = 40;
mat_holder_height = 60;

module mat_holder_base() {
    cube([mat_holder_width, mat_holder_depth, mat_holder_thickness]);
    
    translate([mat_holder_width/2 - mat_width/2, 0, 0])
        cube([mat_holder_thickness, mat_holder_depth, mat_holder_height]);
    translate([mat_holder_width/2 + mat_width/2 - mat_holder_thickness, 0, 0])
        cube([mat_holder_thickness, mat_holder_depth, mat_holder_height]);
    
    translate([0, mat_holder_depth - mat_holder_thickness, 0])
        cube([mat_holder_width, mat_holder_thickness, mat_holder_height]);
}

module negative_side_profile() {
    rotate([90, 0, 0])
    rotate([0, 90, 0])
        linear_extrude(height = mat_holder_width + 2)
            polygon(points=[[0, mat_holder_thickness], [mat_holder_depth - mat_holder_thickness, mat_holder_height], [mat_holder_depth - mat_holder_thickness, mat_holder_height + 1], [-1, mat_holder_height + 1], [-1, mat_holder_thickness]]);
}

module negative_front_profile() {
    mirror([0,1,0])
        rotate([90, 0, 0])
            linear_extrude(height = mat_holder_depth + 2)
                polygon(points=[[0, mat_holder_thickness], [mat_holder_width/2 - mat_width/2, mat_holder_height], [mat_holder_width/2 - mat_width/2, mat_holder_height + 1], [-1, mat_holder_height + 1], [-1, mat_holder_thickness]]);
}

module base_fixation_holes() {
    hull() {
        translate([0, mat_holder_thickness, -1])
            cylinder(d=mat_base_fixation_hole_diameter + 2*loose_slack, h=mat_holder_thickness+2);
            
        translate([0, mat_holder_depth - 2*mat_holder_thickness, -1])
            cylinder(d=mat_base_fixation_hole_diameter + 2*loose_slack, h=mat_holder_thickness+2);
    }
}

module mat_holder() {
    difference() {
        mat_holder_base();

        // Profile the holder
        negative_side_profile();
        negative_front_profile();        
        translate([mat_holder_width, 0, 0])
            mirror([1,0,0])
                negative_front_profile();
        
        // mat fixation holes
        hull() {
            translate([mat_holder_width/2, -1, mat_holder_thickness + mat_fixation_hole_diameter]) {
                rotate([-90, 0, 0])
                    cylinder(d=mat_fixation_hole_diameter+2*loose_slack, h=mat_holder_depth+2);
            
                translate([0, 0, mat_holder_height - 2*mat_holder_thickness - mat_fixation_hole_diameter])
                    rotate([-90, 0, 0])
                        cylinder(d=mat_fixation_hole_diameter+2*loose_slack, h=mat_holder_depth+2);
            }
        }
        
        // base fixation holes
        translate([(mat_holder_width/2 - mat_width/2)/2, 0, 0])
            base_fixation_holes();
        
        translate([mat_holder_width - (mat_holder_width/2 - mat_width/2)/2, 0, 0])
        base_fixation_holes();
    }
}

mat_holder();
