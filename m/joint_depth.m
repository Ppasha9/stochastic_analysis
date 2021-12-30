function joint_depth(irp_temp, b_maxdiag, b_gravity)
	figure('position',[0, 0, 800, 600]);
	xlimits = [1 22];
	ir_plotmodelset(irp_temp, xlimits);
	hold on;
	ir_scatter(irp_temp,'bo');         
	ir_plotline(b_maxdiag, xlimits, 'r-');
	ir_plotline(b_gravity, xlim, 'b--');
	grid on;
	set(gca, 'fontsize', 12);
endfunction
