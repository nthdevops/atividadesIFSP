var nomeAluno = ["José de Andrade", "Maria do Nascimento", "Zezé Legal"];
var nota1 = [5, 9, 3];
var nota2 = [7.8, 5.5, 4];
var pesoNota1 = 0.6;
var pesoNota2 = 0.4;
var nota1F = function(){
    for(var i = 0; i<3; i++){
        return nota1[i]*pesoNota1;
    }
};
var nota2F = function(){
    for(var i = 0; i<3; i++){
        return nota2[i]*pesoNota1;
    }
};
var notaF = function(){
    for(var i = 0; i<3; i++){
        return nota1[i]+nota2[i];
    }
};