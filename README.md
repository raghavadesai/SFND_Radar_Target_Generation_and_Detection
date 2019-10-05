Create a CFAR README File

In a README file, write brief explanations for the following:

Implementation steps for the 2D CFAR process.
Selection of Training, Guard cells and offset.
Steps taken to suppress the non-thresholded cells at the edges.

   % Use RDM[x,y] as the matrix from the output of 2D FFT for implementing
   % CFAR
   
   % CFAR
   
'''MATLAB

   signal_after_threshodling = RDM/max(max(RDM));

   for i = Tr+Gr+1:(Nr/2)-(Gr+Tr)
       for j = Td+Gd+1:Nd-(Gd+Td)

          %Create a vector to store noise_level for each iteration on training cells
           noise_level = zeros(1,1);

           % Calculate noise SUM in the area around CUT
           for p = i-(Tr+Gr) : i+(Tr+Gr)
               for q = j-(Td+Gd) : j+(Td+Gd)
                   if (abs(i-p) > Gr || abs(j-q) > Gd)
                       noise_level = noise_level + db2pow(signal_after_threshodling(p,q));
                   end
               end
           end

           % Calculate threshould from noise average then add the offset
           threshold = pow2db(noise_level/(2*(Td+Gd+1)*2*(Tr+Gr+1)-(Gr*Gd)-1));
           threshold = threshold + offset;
           CUT = signal_after_threshodling(i,j);

           if (CUT < threshold)
               signal_after_threshodling(i,j) = 0;
           else
               signal_after_threshodling(i,j) = 1;
           end

       end
   end



   % *%TODO* :
   % The process above will generate a thresholded block, which is smaller 
   %than the Range Doppler Map as the CUT cannot be located at the edges of
   %matrix. Hence,few cells will not be thresholded. To keep the map size same
   % set those values to 0. 
   signal_after_threshodling(union(1:(Tr+Gr),end-(Tr+Gr-1):end),:) = 0; 
   signal_after_threshodling(:,union(1:(Td+Gd),end-(Td+Gd-1):end)) = 0;
'''

