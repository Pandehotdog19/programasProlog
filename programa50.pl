% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 22 de octubre de 2024
% Descripción: Construye un árbol binario equilibrado en altura con una altura dada.
%              Un árbol equilibrado en altura tiene subárboles cuya diferencia de altura
%              es como máximo 1.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% public class TreeNode
% {
%     public char Value;           // Valor del nodo
%     public TreeNode Left;        // Subárbol izquierdo
%     public TreeNode Right;       // Subárbol derecho
% 
%     public TreeNode(char value)
%     {
%         Value = value;          // Asigna valor al nodo
%         Left = null;           // Inicializa subárbol izquierdo como vacío
%         Right = null;          // Inicializa subárbol derecho como vacío
%     }
% }
% 
% public class Program
% {
%     // Función que construye un árbol equilibrado en altura con una altura dada
%     public static TreeNode BuildHeightBalancedTree(int height)
%     {
%         if (height == 0) return null; // Un árbol de altura 0 es vacío
%         
%         TreeNode root = new TreeNode('x'); // Crea un nuevo nodo
%         root.Left = BuildHeightBalancedTree(height - 1); // Construye el subárbol izquierdo
%         root.Right = BuildHeightBalancedTree(height - 2); // Construye el subárbol derecho
%         return root; // Retorna el árbol construido
%     }
% 
%     // Función principal
%     static void Main()
%     {
%         int height = 3; // Cambia la altura para generar diferentes árboles
%         var tree = BuildHeightBalancedTree(height);
%         // Aquí podrías agregar lógica para imprimir o procesar el árbol
%     }
% }
% ----------------------------------------------

% Construye un árbol binario equilibrado en altura con una altura dada.
% Un árbol equilibrado en altura tiene subárboles cuya diferencia de altura es como máximo 1.
programa50(0, nil).  % Caso base: un árbol de altura 0 es vacío.
programa50(H, t('x', L, R)) :- 
    H > 0, 
    H1 is H - 1,         % Altura del subárbol izquierdo.
    H2 is H1 - 1,        % Altura del subárbol derecho.
    programa50(H1, L),    % Construye el subárbol izquierdo.
    programa50(H2, R).    % Construye el subárbol derecho.

% Ejemplo de uso:
% ?- programa50(3, Tree). % Genera un árbol equilibrado en altura con altura 3 y lo almacena en Tree.
