function [x, n, err, res] = metodoGaussSeidel(A,b,x0,tol,Nmax)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ENTRADA:
    % A:      MATRIZ DE COEFICIENTES DEL SISTEMA A*x = b
    % b:      TÉRMINO INDEPENDIENTE DEL SISTEMA A*x = b (VECTOR COLUMNA)
    % x0:     APROXIMACIÓN INICIAL A LA SOLUCIÓN 'x' (VECTOR COLUMNA INICIAL)
    % tol:    TOLERANCIA (EPSILON), NIVEL DE ERROR ABSOLUTO DESEADO
    % N:      NUMERO MAXIMO DE ITERACIONES
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    % SALIDA:
    % x:      SOLUCIÓN APROXIMADA FINAL
    % n:      NUMERO DE ITERACIONES APLICADAS
    % err:    ESTIMACIÓN DEL ERROR EN CADA ITERACION || x^(n+1) - x^(n) ||
    % res:    NORMA DEL RESIDUO EN CADA ITERACION || A*x^(n+1) - b) ||
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% COMPLETA ESTA PARTE DEL CÓDIGO. EL RESTO DEL ARCHIVO NO LO CAMBIES
    %%%
    %%% Tienes que definir la matriz C y el término independiente B
    %%% del método de Gauss-Seidel, de forma que x^(n+1) = C * x^(n) + B
    %%%
    %%% Evita hacer inv(X) o X^(-1) sobre matrices    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

L=tril(A,-1);
U=triu(A,1);
D=diag(diag(A));



    % Se define la matriz C y el vector columna B
    C = -(L+D)\U;
    B =  (L+D)\b;

    % Se comprueba si hay convergencia o no
    if max(abs(eig(C)))>=1
        warning('Matriz C con radio espectral >=1. El método no converge')
    end


    % Inicialización de variables antes del bucle
    n = 0;                   % Contador de iteraciones
    criterioParada = false;  % Aseguramos al menos una iteración
    x_pre = x0;              % Inicializa 'x_pre' (x^(n)) con el vector inicial x0

    err = [];                % Vector de errores vacío
    res = [];                % Vector de residuos vacío
    
    while ~criterioParada

        % Aumenta el contador de iteraciones
        n = n + 1;
        
        % Se calcula 'x_new' (x^(n+1)) a partir de 'x_pre' (x^(n)) 
        x_new = C * x_pre + B;
     
        % Se calcula la estimación del error
        error = norm( x_new - x_pre);
        err = [err; error];

        % Se calcula la norma del residuo
        residuo = norm( A*x_new - b);
        res = [res; residuo];
    
        % Se actualiza 'x_pre' para la siguiente iteración
        x_pre = x_new;

        % Se actualiza el criterio de parada
        criterioParada = ( error<=tol || n>=Nmax );
    end

    % La aproximación final es la última calculada
    x = x_new;
end

