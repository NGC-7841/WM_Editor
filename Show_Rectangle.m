Settings;
ro = hgtransform;
display_rec = rectangle('Position', [-25,-5,50,10], 'Curvature', [0 0], 'edgecolor', color, 'facecolor', color, 'parent', ro, 'linewidth', 1);
ro.Matrix = makehgtform('zrotate', deg);
pause(rectangle_time);
delete(display_rec);