function theColorImage = BitsPlusPackMonoImage(theMonoImage)% theColorImage = BitsPlusPackMonoImage(theMonoImage)%% In Mono++ mode, the Bits++ box uses the red and green% channels to provide 14-bits per pixel true intensity% resolution.  The blue channel is set to 0 to let the% monochromatic image through.   Emprically, we concluded% that the packing is left adjusted.  That is, the 8 MSB% of the 14-bit input go into the red channel, and the % 6 LSB get left aligned in the green channel, with% the remaining two bits set to 0.%% This routine packs the bits properly for this function.%% 11/17/03   dhb, ip	Wrote it.[m,n] = size(theMonoImage);theColorImage = zeros(m,n,3);% Red channel gets high 8 bitstemp = bitshift(theMonoImage,2);theColorImage(:,:,1) = bitshift(bitand(temp,65280),-8);% Green channel gets low 8 bitstheColorImage(:,:,2) = bitand(temp,255);% Convert to 8-bittheColorImage = uint8(theColorImage);