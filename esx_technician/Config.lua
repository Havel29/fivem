-- The sum of all the 3 values should not increase 111. 
-- Example 1:{1, 10, 50} so, 1+10+50=61 is valid
-- Example 2:{1, 10, 50} so, 5+10+100=115 is invalid
-- timer = 10
iconValues = {1, 10, 50}

Config = {
    BlipName = "Tecnico", -- Name of the marker on the map
    JobBlipName = "Lavoro Tecnico", -- Name of the marker on the map

    MoneyType = true, -- True= Cash | False= Bank
    MoneyAmount = 500, -- Money you get for completing 1 job
    MaxNumberOfFixes = 6,

    Translation = "IT", -- Translation to use

    Jobs = { -- Positions of available jobs
        {X= 176.78, Y= 575.98, Z= 184.73},
        {X= -440.60, Y= 292.38, Z= 83.23},
        {X= -518.66, Y= -48.62, Z= 42.11},
        {X= 434.40, Y= -659.66, Z= 28.81},
        {X= 465.08, Y= -1059.32, Z= 29.21},
        {X= 468.32, Y= -1059.04, Z= 29.21},
        {X= 471.44, Y= -1058.73, Z= 29.21},
        {X= -44.55, Y= -1293.64, Z= 29.16},
        {X= 81.62, Y= -1829.34, Z= 25.77},
        {X= -624.53, Y= -1608.98, Z= 26.90},
        {X= -1172.07, Y= -1384.90, Z= 4.92},
        {X= -1162.77, Y= -1550.97, Z= 4.39},
        {X= -1147.1, Y= -1563.82, Z= 4.41},
        {X= -1061.89, Y= -1641.10, Z= 4.49},
        {X= -1273.11, Y= -1091.96, Z= 7.81},
        {X= -1255.38, Y= -1151.51, Z= 7.59},
        {X= -1270.68, Y= -1369.25, Z= 4.30},
        {X= 1440.90, Y= 1133.75, Z= 114.32},
        {X= 1484.40, Y= 1103.48, Z= 114.33},
        {X= 809.31, Y= 2172.74, Z= 52.32},
        {X= 979.62, Y= 2716.01, Z= 39.50},
        {X= 1094.18, Y= 2654.2, Z= 37.97},
        {X= 1153.85, Y= 2649.87, Z= 38.0},
        {X= 1205.13, Y= 2709.5, Z= 38.0},
        {X= 1234.18, Y= 2733.87, Z= 38.0},
        {X= 1777.56, Y= 3320.36, Z= 41.43},
        {X= 1687.37, Y= 3593.58, Z= 35.59},
        {X= 1986.64, Y= 3786.64, Z= 32.18},
        {X= 2276.47, Y= 3759.19, Z= 38.44},
        {X= 2274.98, Y= 3758.03, Z= 38.43},
        {X= 2269.31, Y= 3756.6, Z= 38.42},
        {X= 2454.80, Y= 3855.37, Z= 39.05},
        {X= 2519.2, Y= 4113.56, Z= 38.63},
        {X= 2525.48, Y= 4126.91, Z= 38.63},
        {X= 2475.3, Y= 4113.55, Z= 38.11},
        {X= 1349.87, Y= -1550.39, Z= 53.90},
        {X= 1216.13, Y= -1531.09, Z= 34.90},
        {X= 1212.49, Y= -1530.31, Z= 34.90},
        {X= 1195.41, Y= -1525.53, Z= 34.69},
        {X= 1191.74, Y= -1529.42, Z= 34.69},
        {X= 1187.94, Y= -1528.88, Z= 34.69},
        {X= 988.08, Y= -1399.81, Z= 31.51},
        {X= 771.33, Y= -1315.70, Z= 26.22},
        {X= 319.28, Y= -995.84, Z= 29.25},
        {X= -28.45, Y= -620.91, Z= 35.46},
        {X= -40.59, Y= -619.26, Z= 35.09},
        {X= -261.30, Y= -1189.07, Z= 23.54},
        {X= -361.15, Y= -1857.89, Z= 20.52},
        {X= -1057.61, Y= -2222.54, Z= 9.07},
        {X= -1068.03, Y= -2006.98, Z= 14.47},
        {X= -819.34, Y= -2105.82, Z= 8.96},
        {X= -657.31, Y= -2364.94, Z= 13.94}
    },

    TranslationList = { -- List of all translation which you car choose
        ["IT"] = {
            ["LOCKER_HELP"] = "Premi ~INPUT_CONTEXT~ per aprire l'armadietto!",
            ["LOCKER_MENU"] = "Armadietto",
            ["WORK_CLOTHES"] = "Abiti lavorativi",
            ["NORMAL_CLOTHES"] = "Abiti comuni",

            ["GARAGE_HELP"] = "Premi ~INPUT_CONTEXT~ per entrare nel garage!",
            ["GARAGE_MENU"] = "Menu del garage",
            ["GARAGE_PROBLEM"] = "~r~ Qualcosa ?? andato storto! Il veicolo non pu?? essere estratto!",
            
            ["DELETE_HELP"] = "Premi ~INPUT_CONTEXT~ per depositare il veicolo!",

            ["MENU_HELP"] = "Premi ~INPUT_SELECT_CHARACTER_FRANKLIN~ per aprire il menu!",
            ["MENU_MENU"] = "Menu",
            ["MENU_NEW"] = "Ottieni nuovo lavoro",
            ["MENU_CREATED"] = "~g~ Ti ?? stata assegnata una riparazione!",
            ["MENU_CANCEL"] = "Annulla riparazione corrente",
            ["MENU_CANCELED"] = "~g~ Riparazione annullata con successo!",
            ["MENU_ALREADY"] = "~r~ Hai gi?? una riparazione attiva! Devi prima annullare quella.",
            ["MENU_NONE"] = "~r~ Non hai riparazioni in corso!",
            ["JOB_HELP"] = "Premi ~INPUT_CONTEXT~ per controllare la centralina!",
            ["JOB_DONE"] = "~g~ Hai risolto i problemi con successo."
        },    
        ["EN"] = {
            ["LOCKER_HELP"] = "Press ~INPUT_CONTEXT~ to open the locker!",
            ["LOCKER_MENU"] = "Locker Menu",
            ["WORK_CLOTHES"] = "Work Clothes",
            ["NORMAL_CLOTHES"] = "Normal Clothes",

            ["GARAGE_HELP"] = "Press ~INPUT_CONTEXT~ to open the garage!",
            ["GARAGE_MENU"] = "Garage Menu",
            ["GARAGE_PROBLEM"] = "~r~ Something went wrong while spawning the vehicle. (Stopped to prevent crash!)",
            
            ["DELETE_HELP"] = "Press ~INPUT_CONTEXT~ to delete your vehicle!",

            ["MENU_HELP"] = "Press ~INPUT_SELECT_CHARACTER_FRANKLIN~ to open your menu!",
            ["MENU_MENU"] = "Menu",
            ["MENU_NEW"] = "Get new job",
            ["MENU_CREATED"] = "~g~ Succesfully created a new job!",
            ["MENU_CANCEL"] = "Cancel current job",
            ["MENU_CANCELED"] = "~g~ Succesfully canceled your job!",
            ["MENU_ALREADY"] = "~r~ You are already doing a job! You first need to cancel it.",
            ["MENU_NONE"] = "~r~ You have no active job!",
            ["JOB_HELP"] = "Press ~INPUT_CONTEXT~ to take a look!",
            ["JOB_DONE"] = "~g~ Succesfully fixed the problems."
        },
        ["NL"] = {
            ["LOCKER_HELP"] = "Druk op ~INPUT_CONTEXT~ om de kleding kast te openen!",
            ["LOCKER_MENU"] = "Kleding Menu",
            ["WORK_CLOTHES"] = "Werk Kleding",
            ["NORMAL_CLOTHES"] = "Normale Kleding",

            ["GARAGE_HELP"] = "Druk op ~INPUT_CONTEXT~ om de garage te openen!",
            ["GARAGE_MENU"] = "Garage Menu",
            ["GARAGE_PROBLEM"] = "~r~ Er is iets fout gegaan tijdens het spawnen van het voertuig. (Gestopt om een crash te voorkomen!)",
            
            ["DELETE_HELP"] = "Druk op ~INPUT_CONTEXT~ om je voertuig je verwijderen!",

            ["MENU_HELP"] = "Druk op ~INPUT_SELECT_CHARACTER_FRANKLIN~ om je menu te openen!",
            ["MENU_MENU"] = "Menu",
            ["MENU_NEW"] = "Nieuwe opdracht",
            ["MENU_CREATED"] = "~g~ Succesvol een nieuw opdracht gemaakt!",
            ["MENU_CANCEL"] = "Be??indig huidige opdracht",
            ["MENU_CANCELED"] = "~g~ Opdracht succesvol be??indigd!",
            ["MENU_ALREADY"] = "~r~ U bent als bezig met een opdracht! U moet deze eerst be??indigen.",
            ["MENU_NONE"] = "~r~ U heeft geen huidige opdracht!",

            ["JOB_HELP"] = "Druk op ~INPUT_CONTEXT~ om een kijkje te nemen!",
            ["JOB_DONE"] = "~g~ Het probleem is succesvol op gelost. Je hebt er ~b~???100,-~g~ voor gekregen!"
        }
    }
}
