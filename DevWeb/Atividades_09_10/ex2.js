var nomeAluno = "João da Silva";
var nota1 = 7;
var nota2 = 8.5;
var pesoNota1 = 0.6;
var pesoNota2 = 0.4;
var nota1F = nota1 * pesoNota1;
var nota2F = nota2 * pesoNota2;
var notaF = nota1F + nota2F;

alert("Nome: " + nomeAluno + ". Primeira Nota: " + nota1 + ". Segunda Nota: " + nota2);
alert("Nota Total: " + notaF.toFixed(2));