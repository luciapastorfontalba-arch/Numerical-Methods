function [x, n, err, res] = metodoNewtonSistemas(f,f_Jac,x0,tol,Nmax)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ENTRADA:
    % f:      FUNCION (OLUMNA) QUE DEFINE EL SISTEMA DE ECUACIONES f(x)=0
    % f_Jac:  FUNCION MATRIZ JACOBIANA DE "f" 
    % x0:     APROXIMACIÓN INICIAL A LA SOLUCIÓN 'x' (VECTOR COLUMNA INICIAL)
    % tol:    TOLERANCIA (EPSILON), NIVEL DE ERROR ABSOLUTO DESEADO
    % N:      NUMERO MAXIMO DE ITERACIONES
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    % SALIDA:
    % x:      SOLUCIÓN APROXIMADA FINAL 
    % n:      NUMERO DE ITERACIONES APLICADAS
    % err:    ESTIMACIÓN DEL ERROR EN CADA ITERACION || x^(n+1) - x^(n) ||
    % res:    NORMA DEL RESIDUO EN CADA ITERACION || f(x^(n+1)) ||
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    % Inicialización de variables antes del bucle
    n = 0;                   % Contador de iteraciones
    criterioParada = false;  % Aseguramos al menos una iteración
    x_pre = x0;              % Inicializa 'x_pre' (x^(n)) con el vector inicial x0

    err = [];                % Vector de errores vacío
    res = [];                % Vector de residuos vacío  
    while ~criterioParada

        % Aumenta el contador de iteraciones
        n = n + 1;

        % Evaluamos la función "f" y su jacobiano "f_Jac"
        J = f_Jac(x_pre);
        F = f(x_pre);

        % Se resuelve el SEL J*U = -F, siendo U = x_new - x_pre
        U = J\(-F);
        
        % Se calcula 'x_new' (x^(n+1)) a partir de 'x_pre' (x^(n)) y 'U'         
        x_new = U + x_pre;
     
        % Se calcula la estimación del error
        error = norm( x_new - x_pre);
        err = [err; error];

        % Se calcula la norma del residuo
        residuo = norm( f(x_new) );
        res = [res; residuo];        

        % Actualizar "x_pre" para la siguiente iteración
        x_pre = x_new;

        % Se actualiza el criterio de parada
        criterioParada = ( error<=tol || n>=Nmax );
    end

    % La aproximación final es la última calculada
    x = x_new;
    
end

