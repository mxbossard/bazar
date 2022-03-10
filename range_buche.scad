width = 50;

ext_depth = 50;
ext_thickness = 2;

int_depth = 50;
int_thickness = 2;

feet_length = 2;

hardener_width = 5;

bridge_width = 50;
bridge_height = 50+ext_thickness;

fence_width = 4;

shelf_thickness = 1;

cross_count = 2.5;

ext_width = width;
int_width = width - 2*ext_thickness;
//base_length = int_width/1.6;
//base_length = int_width;
base_length = 40;
height = feet_length + 2*ext_thickness + base_length + int_width * cross_count + int_thickness*sqrt(2) * (cross_count-0.5);

module hardener() {
    color("orange")
    translate([0,0,-ext_thickness])
    linear_extrude(ext_thickness)
    translate([0,-hardener_width/2,0])
    square([ext_width, hardener_width]);
}

module fence() {
    square([fence_width, fence_width]);
}

module internal_cross() {
    color("lightblue")
    translate([0,0,(ext_depth-int_depth)/2])
    linear_extrude(int_depth) {
        translate([width/2,int_width/2,0])
        rotate([0, 0, 45]) {
            translate([-int_width * sqrt(2) / 2 - int_thickness/2, -int_thickness/2])
                square([int_width * sqrt(2) + int_thickness, int_thickness]);
            translate([-int_thickness/2, -int_width * sqrt(2) / 2 - int_thickness/2])
                square([int_thickness, int_width * sqrt(2) + int_thickness]);
        }
    }
}

module internal_shelf() {
    cube([int_width/2,shelf_thickness, int_depth]);
}

module frame() {
    
    color("lightgreen")
    linear_extrude(ext_depth) {
        // Sides
        square([ext_thickness, height]);
        translate([width - ext_thickness, 0])
            square([ext_thickness, height]);
        
        // Extra feet
        translate([ext_width/2 - ext_thickness/2, 0])
            square([ext_thickness, feet_length]);
    
        // Bottom
        translate([ext_thickness, feet_length])
            square([int_width, ext_thickness]);
        
        // top
        translate([0, height-ext_thickness])
            square([ext_width, ext_thickness]);
    }
}

module internal() {
    color("lightblue")
    render(convexity = 1)
    intersection() {
        // n internal crosses
        for(y = [feet_length+ext_thickness+base_length + int_thickness * sqrt(2)/2 : int_width +int_thickness * sqrt(2) : height-ext_thickness]) {
            // Internal cross
            translate([0,y,0]){
                internal_cross();                
            }
        }
        
        translate([ext_thickness, feet_length+ext_thickness,-10])
            cube([int_width,height-feet_length-2*ext_thickness,ext_depth+20]);
    }
    
    // Left shelf
    translate([ext_thickness,feet_length+ext_thickness+base_length+int_width/2-shelf_thickness/2 + int_thickness*sqrt(2)/2 ,0])
        internal_shelf();
    
    // Right shelf
    translate([ext_thickness+int_width/2,feet_length+ext_thickness+base_length+int_width/2-shelf_thickness/2 + 3*int_thickness*sqrt(2)/2 + int_width ,0])
        internal_shelf();
}

module hardeners() {   
    // n hardener
    for(y = [feet_length+ext_thickness+base_length : int_width + int_thickness * sqrt(2) : height-hardener_width]) {
        translate([0,y,0])
            hardener();
    }
}

module side_bridge() {
    color("lightgrey")
    linear_extrude(ext_depth) {
        translate([-bridge_width,0,0]) {
            // Side
            square([ext_thickness, bridge_height]);
            
            // Top
            translate([0,bridge_height-ext_thickness,0])
                square([bridge_width, ext_thickness]);
            
            // Bottom
            translate([0,feet_length,0])
                square([bridge_width, ext_thickness]);
        }
        
        // Mid foot
        translate([-bridge_width/2-ext_thickness/2,0,0])
            square([ext_thickness, feet_length]);
    }
    
    // Fences
}

module panier() {
    l = 36;
    L = 70;
    h1 = 34;
    h2 = 45;
    ance_largeur = 5;
    ance_radius = (h2 - h1)*2/3;
    p = 80;
    color("brown")
    translate([width/2-l/2, feet_length + ext_thickness,0]) {
        // base
        cube([l,h1,L]);
        
        // ance
        translate([0, h1,L/2-ance_largeur/2])
            cube([l,(h2-h1)-ance_radius,ance_largeur]);
        translate([ance_radius, h1+(h2-h1)-ance_radius,L/2-ance_largeur/2])
            cube([l-2*ance_radius,ance_radius,ance_largeur]);
        translate([ance_radius, h1+(h2-h1)-ance_radius,L/2-ance_largeur/2])
            cylinder(ance_largeur,ance_radius,ance_radius,$fn=p);
        translate([l-ance_radius, h1+(h2-h1)-ance_radius,L/2-ance_largeur/2])
            cylinder(ance_largeur,ance_radius,ance_radius,$fn=p);
    }
}

frame();
internal();
//hardeners();
//side_bridge();

panier();

