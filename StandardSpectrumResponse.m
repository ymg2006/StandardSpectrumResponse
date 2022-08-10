function B = StandardSpectrumResponse(EarthType,HighRisk)
    if (~isfinite(EarthType) && EarthType~=floor(EarthType) && max(size(EarthType)) ~= 1)
        erorr("Invalid argument at position 1. Value must be Integer");
    elseif (~isfinite(HighRisk) && HighRisk~=floor(HighRisk) && max(size(HighRisk)) ~= 1)
        erorr("Invalid argument at position 2. Value must be Integer");
    end
    mustBeInRange(HighRisk,0,1,"inclusive");
    mustBeInRange(EarthType,1,4,"inclusive");

syms B1(T) N(T)
[T0,TS,S,S0] = RectifierCoefficients(EarthType, HighRisk);

    B1(T) = piecewise((T >= 0) & (T < T0) , S0+(S-S0+1)*(T/T0) , (T >= T0) & (T < TS) , S+1 , (T >= TS) , (S+1)*(TS/T));

    if (HighRisk)
        N(T) = piecewise((T < TS) , 1 , (T >= TS) & (T < 4) , (0.7/(4-TS))*(T-TS)+1 , (T >= 4) , 1.7);
    else
        N(T) = piecewise((T < TS) , 1 , (T >= TS) & (T < 4) , (0.4/(4-TS))*(T-TS)+1 , (T >= 4) , 1.4);
    end
    
    B=B1(T)*N(T);
end