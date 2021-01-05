import csv

def showCountryInfo(countryDict, countryName):
    print("     País        Confirmados      Recuperados       Mortes    ")
    countryNameStr = getStringSpaced(14, countryName)
    confirmedStr = getStringSpaced(17, str(countryDict[countryName]["confirmed"]))
    recoveredStr = getStringSpaced(17, str(countryDict[countryName]["recovered"]))
    deathsStr = getStringSpaced(14, str(countryDict[countryName]["deaths"]))
    infoString = countryNameStr + confirmedStr + recoveredStr + deathsStr
    print(infoString)

def getStringSpaced(totalHeader, rowStr):
    dif = totalHeader - len(rowStr)
    if dif != 0:
        division = dif / 2
        before = 0
        after = 0
        if dif % 2 != 0:
            before = int(division + 0.5)
            after = int(division - 0.5)
        else:
            before = int(division)
            after = int(division)
        newStr = ""
        for count in range(0, before):
            newStr += " "
        newStr += rowStr
        for count in range(0, after):
            newStr += " "
        return newStr
    else:
        return rowStr



with open('countries-aggregated.csv', mode='r') as csv_file:
    csv = list(csv.reader(csv_file))
    numberOfLinesIndexed = len(csv) - 1
    columnsIndex = {}
    covidCountriesInfo = {}

    #Linha 0 é a de cabeçalho, por isso csv[0]
    for count in range(0, len(csv[0])):
        columnsIndex[csv[0][count]] = count
    
    #Começa da linha de index 1, pois 0 é o cabeçalho
    for rowIndex in range(1, numberOfLinesIndexed):
        country = csv[rowIndex][columnsIndex["Country"]]
        confirmed = int(csv[rowIndex][columnsIndex["Confirmed"]])
        recovered = int(csv[rowIndex][columnsIndex["Recovered"]])
        deaths = int(csv[rowIndex][columnsIndex["Deaths"]])
        #Se o país não tiver sido registrado no dict, cria o dict básico para as informações dos países
        if not country in covidCountriesInfo.values():
            covidCountriesInfo[country] = {"confirmed" : 0, "recovered" : 0, "deaths" : 0}
        #Adiciona os valores do país que estão naquela linha no dict do respectivo país
        covidCountriesInfo[country]["confirmed"] += confirmed
        covidCountriesInfo[country]["recovered"] += recovered
        covidCountriesInfo[country]["deaths"] += deaths
    
    arrayThreeBiggest = [{"country" : "", "deaths" : 0}, {"country" : "", "deaths" : 0} , {"country" : "", "deaths" : 0}]
    for key in covidCountriesInfo:
        for arrPos in range(0, len(arrayThreeBiggest)):
            if covidCountriesInfo[key]["deaths"] > arrayThreeBiggest[arrPos]["deaths"]:
                for changePos in range(len(arrayThreeBiggest)-1, arrPos, -1):
                    arrayThreeBiggest[changePos]["country"] = arrayThreeBiggest[changePos-1]["country"]
                    arrayThreeBiggest[changePos]["deaths"] = arrayThreeBiggest[changePos-1]["deaths"]
                arrayThreeBiggest[arrPos]["country"] = key
                arrayThreeBiggest[arrPos]["deaths"] = covidCountriesInfo[key]["deaths"]
                break
    
    print("Os 3 primeiros países com maior número de mortes:\n     País          Total De Mortes     ")
    for pos in arrayThreeBiggest:
        print(getStringSpaced(14, pos["country"])+getStringSpaced(25, str(pos["deaths"])))
    
    print("\nStatus do Brasil")
    showCountryInfo(covidCountriesInfo, "Brazil")
    
    print("\nStatus dos Estados Unidos")
    showCountryInfo(covidCountriesInfo, "US")