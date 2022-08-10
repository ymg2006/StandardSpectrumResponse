function [T0,TS,S,S0] = RectifierCoefficients(EarthType,HighRisk)
    if (~isfinite(EarthType) && EarthType~=floor(EarthType) && max(size(EarthType)) ~= 1)
        erorr("Invalid argument at position 1. Value must be Integer");
    elseif (~isfinite(HighRisk) && HighRisk~=floor(HighRisk) && max(size(HighRisk)) ~= 1)
        erorr("Invalid argument at position 2. Value must be Integer");
    end
    mustBeInRange(HighRisk,0,1,"inclusive");
    mustBeInRange(EarthType,1,4,"inclusive");
    
    Mat_T0 = [0.1, 0.1, 0.15, 0.15];
    Mat_TS = [0.4,0.5,0.7,1];
    Mat_S_0 = [1.5,1.5,1.75,2.25];
    Mat_S0_0 = [1,1,1.1,1.3];
    Mat_S_1 = [1.5,1.5,1.75,1.75];
    Mat_S0_1 = [1,1,1.1,1.1];
    
        T0 = Mat_T0(EarthType);
        TS = Mat_TS(EarthType);
    
    if(HighRisk)
        S = Mat_S_1(EarthType);
        S0 = Mat_S0_1(EarthType);
    else
        S = Mat_S_0(EarthType);
        S0 = Mat_S0_0(EarthType);
    end
end