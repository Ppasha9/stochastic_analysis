function prediction(x, y, irp_temp, b_maxdiag, b_gravity)
	X = [ x.^0 x ];
	yp0 = ir_predict(irp_temp, X);

	yp0mid = mean(yp0,2);         
	yp0rad = 0.5 * (yp0(:,2) - yp0(:,1));

	yp0rad_rel = 100 * yp0rad ./ yp0mid; 
	
	xp = [22; 32; 42; 52; 62];
	Xp = [xp.^0 xp];

	yp = ir_predict(irp_temp, Xp);  
	ypmid = mean(yp,2);             
	yprad = 0.5 * (yp(:,2) - yp(:,1));
	
	for i=1:5
		fprintf("[%d, %d]\n", yp(i, 1), yp(i, 2));
	endfor
	display(yprad);
	
	yprad_relative = 100 * yprad ./ ypmid;
	
	figure('position',[0, 0, 800, 600]);
	xlimits = [0 70];
	ir_plotmodelset(irp_temp, xlimits);  

	hold on;
	ir_scatter(irp_temp,'bo');     
	ir_plotline(b_maxdiag, xlimits, 'r-');
	ir_plotline(b_gravity, xlim, 'b--');  
	ir_scatter(ir_problem(Xp, ypmid, yprad),'ro');
	grid on;
	set(gca, 'fontsize', 12);
endfunction
