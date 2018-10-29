$fn=100;

peice1_height = 9.5;
peice1_width = 4;
peice1_thickness = 3;
peice1_Ratio = 0.9;
    
peice2_height = 33;
peice2_width = 20;
peice2_thickness = 3;
piece2_hole_diameter = 12;
piece2_hole_x_shift = 5.5;
piece2_hole_y_shift = 3;

global_thickness = 10;
global_attach_gap = 11.5;

module piece1() {


    polygon(points = [[0,0],[0,peice1_height],[peice1_width,peice1_height],[peice1_width,peice1_height-peice1_thickness],[peice1_width/2*(2-peice1_Ratio),peice1_height-peice1_thickness],[peice1_width/2*peice1_Ratio,0]]);
}

module piece2() {

    
    difference() {
        polygon(points = [[0,0],[0,peice2_height],[peice2_width,peice2_height],[peice2_width,peice2_height*0.8],[peice2_width*0.8,peice2_height*0.6],[peice2_width*0.5,peice2_height*0.5],[peice2_thickness,0]]);
        translate([piece2_hole_x_shift + piece2_hole_diameter/2, peice2_height - piece2_hole_diameter/2 + piece2_hole_y_shift])
            circle(d=piece2_hole_diameter);
    }
}

module global() {
    piece1_y1 = (peice2_height - global_attach_gap - 2*peice1_height)/2;
    piece1_y2 = piece1_y1 + global_attach_gap + peice1_height;
    
    translate([-peice1_width, piece1_y1])
        piece1();
    
    translate([-peice1_width, piece1_y2])
        piece1();

    piece2();
}

// Etrude global
linear_extrude(height = global_thickness)
    global();

// Extrude piece2 on top of global
translate([0,0,global_thickness])
    linear_extrude(height = 2)
        piece2();