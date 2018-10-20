$fn=200;

include <Pulley_T-MXL-XL-HTD-GT2_N-tooth.scad>;

// tuneable constants
teeth = 32;			// Number of teeth, standard Mendel T5 belt = 8, gives Outside Diameter of 11.88mm
profile = 0;		// 1=MXL 2=40DP 3=XL 4=H 5=T2.5 6=T5 7=T10 8=AT5 9=HTD_3mm 10=HTD_5mm 11=HTD_8mm 12=GT2_2mm 13=GT2_3mm 14=GT2_5mm

retainer_ht = 0.5;	// Belt retainer above teeth : height of retainer flange over pulley, standard = 1.5
idler_ht = 0.5;		// Belt retainer below teeth : height of idler flange over pulley, standard = 1.5
pulley_b_ht = 0;    // pulley base height, standard = 8. Set to 0 idler but no pulley.
pulley_t_ht = 6;	// length of toothed part of pulley, standard = 12
pulley_b_dia = 20;	// pulley base diameter, standard = 20
no_of_nuts = 1;		// number of captive nuts required, standard = 1
nut_angle = 90;		// angle between nuts, standard = 90
nut_shaft_distance = 1.2;	// distance between inner face of nut and shaft, can be negative.

// Config for double pulley
motor_shaft = 11;
bearing_diameter = 13.1;
bearing_width = 5;

// Config for simple pulley
simple_pulley_base_width = 1;
simple_pulley_ergo_diameter = 2;
simple_pulley_ergo_shift = 7;
simple_pulley_ergo_length = 4;

module half_double_pulley() {
    difference() {
        union() {
            pulley(
                    belt_description          = "GT2 2mm"
                    , pulley_OD               = calc_pulley_dia_tooth_spacing (teeth, 2,0.254) // Set the pulley diameter for a given number of teeth
                    , teeth                   = teeth
                    , tooth_depth             = 0.764 
                    , tooth_width             = 1.494
                    , additional_tooth_depth  = additional_tooth_depth
                    , additional_tooth_width  = additional_tooth_width
                    , motor_shaft             = 0 )
            tooth_profile_GT2_2mm(height = pulley_t_ht);
        }

        union() {
        translate([0,0,-1])
            cylinder(h=pulley_t_ht + 2 + retainer_ht + idler_ht + pulley_b_ht, d=motor_shaft, center=[0,0,0]);
            
        translate([0,0,-1])
            cylinder(h=bearing_width + 1, d=bearing_diameter, center=[0,0,0]);
            
        }
    }
}

module simple_pulley() {
    pulley_OD = calc_pulley_dia_tooth_spacing (teeth, 2,0.254);
    
    difference() {
        
        union() {
            translate([0,0,simple_pulley_base_width]) {
                pulley(
                        belt_description          = "GT2 2mm"
                        , pulley_OD               = calc_pulley_dia_tooth_spacing (teeth, 2,0.254) // Set the pulley diameter for a given number of teeth
                        , teeth                   = teeth
                        , tooth_depth             = 0.764 
                        , tooth_width             = 1.494
                        , additional_tooth_depth  = additional_tooth_depth
                        , additional_tooth_width  = additional_tooth_width
                        , motor_shaft             = 0 )
                tooth_profile_GT2_2mm(height = pulley_t_ht);
            }
            
            cylinder(h=simple_pulley_base_width, d=2*idler_ht + pulley_OD, center=[0,0,0]);
            
            translate([simple_pulley_ergo_shift,0,-simple_pulley_ergo_length])
                cylinder(h=simple_pulley_ergo_length, d=simple_pulley_ergo_diameter, center=[0,0,0]);
            translate([-simple_pulley_ergo_shift,0,-simple_pulley_ergo_length])
                cylinder(h=simple_pulley_ergo_length, d=simple_pulley_ergo_diameter, center=[0,0,0]);
        }

        union() {
            translate([0,0,-1])
                cylinder(h=simple_pulley_base_width + pulley_t_ht + 2 + retainer_ht + idler_ht + pulley_b_ht, d=4.1, center=[0,0,0]);

            }
        }
    
}

module double_pulley() {
    half_double_pulley();

    translate([0,0,2*(pulley_t_ht + retainer_ht + idler_ht + pulley_b_ht)])
        rotate([0,180,0])
            half_double_pulley();
}

simple_pulley();

//double_pulley();