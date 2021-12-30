function [x, y, x_filt, y_filt, x_step, y_step] = preprocessing(data)
	x = data(:, 1);
	y = data(:, 2);
	
	left_bound = 1;
	right_bound = 230;
	x_filtered_indexes = (x > left_bound) & (x < right_bound);
	x_filt = x(x_filtered_indexes);
	y_filt = y(x_filtered_indexes);
	
	n = 10;	
	for i = 1:n
		x_step(i) = x_filt(2 * i - 1);
		y_step(i) = y_filt(2 * i - 1);
	endfor
	x_step = transpose(x_step);
	y_step = transpose(y_step);
endfunction
