function edje_points(x, y, irp_temp)
	m = length(x);
	X = [ x.^0 x ];
	MY_EPS = 0.001;
	cur_x = irp_temp.y;
	cur_eps = irp_temp.epsilon;

	yp0 = ir_predict(irp_temp, X); 

	for i = 1:m
		x_top = cur_x(i) + cur_eps(i);
		x_bot = cur_x(i) - cur_eps(i);

		y_top = yp0(i, 2);
		y_bot = yp0(i, 1);
		if abs(y_top - x_top) < MY_EPS
			display(i);
		endif
		if abs(y_bot - x_bot) < MY_EPS
			display(i);
		endif
	endfor

	border_x = [-1, 1];
	border_y = [-1, 1];

	for i = 1:m
		cur_point_x = x(i);
		cur_point_y = y(i);
		figure('position',[0, 0, 800, 600]);
		xlimits = [0 22];
		ir_plotmodelset(irp_temp, xlimits);
		hold on;
		ir_scatter(irp_temp,'bo');         
		grid on;
		set(gca, 'fontsize', 12);
		xlim([cur_point_x + border_x(1), cur_point_x + border_x(2)]);
		ylim([cur_point_y + border_y(1), cur_point_y + border_y(2)]);
	endfor
endfunction
