function [value,iteration,relative]= Integral(f,T,h,tol)
    

    currentValue = IntegralTriangle(f,T,h)
    [T1, T2, T3, T4 ]= subTriangles(T);
    v1 = IntegralTriangle(f,T1,h/2);
    v2 = IntegralTriangle(f,T2,h/2);
    v3 = IntegralTriangle(f,T3,h/2);
    v4 = IntegralTriangle(f,T4,h/2);
     
    nextValue = v1 + v2 + v3 + v4;
    if abs(currentValue - nextValue) <= 2*tol
        value = nextValue
        relative = (nextValue - currentValue) /nextValue; 
        iteration = 2
    else 

        [Value1,iteration1]=Integral(f,T1,h/2,tol/4);
        [Value2,iteration2]=Integral(f,T2,h/2,tol/4);
        [Value3,iteration3]=Integral(f,T3,h/2,tol/4);
        [Value4,iteration4]=Integral(f,T4,h/2,tol/4);
        
        value = Value1+ Value2 + Value3 + Value4;
        iteration = iteration1 + iteration2 + iteration3 + iteration4 + 2;
        
    end
    
end