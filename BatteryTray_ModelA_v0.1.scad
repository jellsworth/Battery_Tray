/*
Battery tray for AA
Charged and ready to charge

Goal: No support material req'd

Min clearance dimensions on AA = 51mm x 15mm

To Do:
1) create sloping base
2) cutouts for access
3) 

*/

battery_len = 51;
battery_diam = 15;
battery_widenum = 3;
wall_thick = 1;
full = 150; //when you want "a lot"


union() {

	difference() { // build the box
		cube([battery_len * 2 + wall_thick * 3, battery_diam * battery_widenum + wall_thick * 2, battery_diam * 2 + wall_thick], center = true);
	
		// remove + well
		translate([(battery_len + wall_thick) / 2, 0, wall_thick]) {
			cube([battery_len, battery_diam * battery_widenum, battery_diam * 2 + wall_thick], center = true);
		}
	
		// remove - well
		translate([-(battery_len + wall_thick) / 2, 0, wall_thick]) {
			cube([battery_len, battery_diam * battery_widenum, battery_diam * 2 + wall_thick], center = true);
		}
	} // end of diff

	// add the tabs
	// + tab
	translate([battery_len/ 2, -battery_diam * 1.5 - 5.1, battery_diam + wall_thick ]) {
		union() { // this union is just to allow the ! operator to tweak the tab
			labelTab();
			#translate([0, 2.4, 2.4]) 
				rotate([-55, 0, 0]) {
					cube([3, 1, 1.5], center = true);
					cube([1, 3, 1.5], center = true);
				}
		}
	} // end translate

	// - tab
	translate([-battery_len/ 2, battery_diam * 1.5 + 5.1, battery_diam + wall_thick ]) {
	rotate([0, 0, 180])
		union() { // this union is just to allow the ! operator to tweak the tab
			labelTab();
			#translate([0, 2.4, 2.4]) 
				rotate([-55, 0, 0]) {
					cube([3, 1, 1.5], center = true);
				}
		}
	}
} // end union



module labelTab() { 
// figure out how to make this parametric another day
difference() {
	cube([5, 10, 16], center = true);
	translate([0, 5, 7])
		rotate([35, 0, 0]) {
			cube([10, 10, 20], center = true);
		}
	translate([0, -wall_thick * 3, -wall_thick *2])
		rotate([35, 0, 0]) {
			cube([10, 10, 20], center = true);
		}
	translate([0, -5, 0])
		cube([10, 10, 20], center = true);
}	
}




