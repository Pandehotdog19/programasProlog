% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 22 de octubre de 2024
% Descripción: Genera el código Gray de N bits.
%              Un código Gray es una secuencia binaria donde
%              dos valores consecutivos difieren en solo un bit.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     // Función que genera el código Gray para N bits.
%     static List<string> GrayCode(int n)
%     {
%         if (n == 1)
%             return new List<string> { "0", "1" };

%         var previousGray = GrayCode(n - 1);
%         var result = new List<string>();

%         // Agrega '0' al prefijo de la secuencia anterior.
%         foreach (var code in previousGray)
%             result.Add("0" + code);

%         // Agrega '1' al prefijo de la secuencia invertida.
%         for (int i = previousGray.Count - 1; i >= 0; i--)
%             result.Add("1" + previousGray[i]);

%         return result;
%     }

%     // Función principal.
%     static void Main()
%     {
%         int n = 3; // Cambia N para generar diferentes longitudes de código Gray.
%         var grayCode = GrayCode(n);
%         foreach (var code in grayCode)
%             Console.WriteLine(code);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Genera el código Gray de N bits.
% La secuencia de código Gray es una secuencia binaria en la que dos valores consecutivos difieren en solo un bit.
programa43(1, ['0', '1']).  % Caso base: para 1 bit, el código Gray es ['0', '1'].
programa43(N, C) :- 
    N > 1,                     % Verifica que N sea mayor que 1.
    N1 is N - 1,               % Decrementa N en 1.
    programa43(N1, C1),              % Llama recursivamente para obtener el código Gray de N-1 bits.
    maplist(atom_concat('0'), C1, C0),      % Agrega '0' al prefijo de cada elemento en C1.
    reverse(C1, C1R),          % Invierte la lista C1.
    maplist(atom_concat('1'), C1R, C1G),     % Agrega '1' al prefijo de cada elemento en C1R.
    append(C0, C1G, C).        % Combina ambas listas para formar el código Gray de N bits.

% Ejemplo de uso:
% ?- programa43(3, C). % Genera el código Gray de 3 bits y lo almacena en C.
