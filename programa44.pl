% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 22 de octubre de 2024
% Descripción: Genera un árbol de Huffman dado un conjunto de frecuencias.
%              El algoritmo de Huffman se utiliza para la compresión de datos,
%              construyendo un árbol binario óptimo para la codificación.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;

% class HuffmanNode
% {
%     public char Symbol;
%     public int Frequency;
%     public HuffmanNode Left;
%     public HuffmanNode Right;

%     public HuffmanNode(char symbol, int frequency)
%     {
%         Symbol = symbol;
%         Frequency = frequency;
%         Left = null;
%         Right = null;
%     }
% }

% class Program
% {
%     // Función que genera un árbol de Huffman dado un conjunto de frecuencias.
%     static HuffmanNode BuildHuffmanTree(Dictionary<char, int> frequencies)
%     {
%         var nodes = frequencies.Select(f => new HuffmanNode(f.Key, f.Value)).ToList();

%         while (nodes.Count > 1)
%         {
%             // Ordena los nodos por frecuencia.
%             nodes = nodes.OrderBy(n => n.Frequency).ToList();
%             var left = nodes[0];
%             var right = nodes[1];

%             // Crea un nuevo nodo padre.
%             var parent = new HuffmanNode('\0', left.Frequency + right.Frequency)
%             {
%                 Left = left,
%                 Right = right
%             };

%             // Reemplaza los nodos utilizados con el nodo padre.
%             nodes.Remove(left);
%             nodes.Remove(right);
%             nodes.Add(parent);
%         }

%         return nodes.First(); // Retorna la raíz del árbol de Huffman.
%     }

%     // Función principal.
%     static void Main()
%     {
%         var frequencies = new Dictionary<char, int>
%         {
%             {'a', 5},
%             {'b', 9},
%             {'c', 12},
%             {'d', 13},
%             {'e', 16},
%             {'f', 45}
%         };

%         var huffmanTree = BuildHuffmanTree(frequencies);
%         Console.WriteLine("Árbol de Huffman construido.");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Genera un árbol de Huffman dado un conjunto de frecuencias.
% https://es.wikipedia.org/wiki/Codificación_Huffman
huffman(Fs, Hs) :- 
    length(Fs, Len), 
    Len > 1, 
    sort(2, @=<, Fs, Sorted), 
    huffman_tree(Sorted, Hs).

% Caso base para construir el árbol de Huffman.
huffman_tree([fr(X, _) | []], hc(X, '0')).  % Si solo queda un símbolo, se crea un nodo hoja.
huffman_tree([fr(_, _) | [fr(_, _) | _]], _).  % Caso no implementado: se necesita lógica para construir el árbol.

% Nota: El código para construir el árbol de Huffman en Prolog necesita completarse.
