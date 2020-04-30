$fn = 100;

screw_diameter = 4;

axe_to_axe_min = 0;

axe_to_axe_max = 30;

circle(d=screw_diameter);

hull() {
    translate([axe_to_axe_min, 0])
        circle(d=screw_diameter);
    
    translate([axe_to_axe_max, 0])
        circle(d=screw_diameter);
}