Settings;
%disp(noise);
mat = zeros(height,width, 3, len); 
%F = VideoWriter(FileName);
%F.FrameRate = framerate;
%open(F);
%tic;
for i = 1:len
    mat(31:60, 26:55, 1, i) = ones(30) * noise1(i);
    mat(31:60, 66:95, 2, i) = ones(30);
    mat(31:60, 106:135, 3, i) = ones(30) * noise2(i);
    image(mat( :, :, :, i));
    drawnow;
    %writeVideo(F, mat(:, :, :, i));
end
%toc;
%disp(toc);
%close(F);