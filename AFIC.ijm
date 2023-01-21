//Fiji Version 1.53t 24 August 2022
//This macro was written for 3 channel stacked image with order of Green - Red - Blue.
x = 1;
while (x > 0) {
	path_name = "path_name";
	//enter path name
	//you may need to change "/" to "\" depending file naming system of your computer
	//you may need to change file name regarding to your microscope
	open(path_name + "/Image_0" + x + ".tif");
	run("Stack to Images");
	run("Merge Channels...", "c1=Image_0" + x + "-0002 c2=Image_0" + x + "-0003 c3=Image_0" + x + "-0001 keep ignore");
	//save the merged and colored image
	saveAs("Tiff", path_name + "/image_0" + x + "_RGB.tif");
	close();
	//starting from this line chanels are colored and saved seperately
	//change color here
	run("Green");
	saveAs("Tiff", path_name + "/Image_0" + x + "-0003.tif");
	close();
	run("Red");
	saveAs("Tiff", path_name + "/Image_0" + x + "-0002.tif");
	close();
	run("Blue");
	saveAs("Tiff", path_name + "/Image_0" + x + "-0001.tif");
	close();
	x = x + 1;
}